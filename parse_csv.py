#!/usr/bin/env python3
import argparse
import boto3
import psycopg
import argparse
import configparser
import json
import db


def get_csv(year: str, month: str, chunk_size=1024):
    s3 = boto3.resource('s3')
    csv = s3.Object("work-sample-mk", f"{year}/{month}/events.csv").get().get("Body")
    lines = list(csv.iter_lines(chunk_size=chunk_size))
    csv.close()
    return lines


def parse_csv(year: str, month: str, sql_config="config.ini"):
    config = configparser.ConfigParser()
    config.read(sql_config)
    sql_params = config["SQL"]
    lines = get_csv(year, month)
    with psycopg.connect(**sql_params) as conn:
        with conn.cursor() as cur:
            try:
                for line in lines[1:]:
                    line = line.decode()
                    line = line.split(",")
                    line = line[:7] + \
                        [json.loads(",".join(line[7:])[1:-1].replace("'", '"'))]
                    save_line(cur, *line)
                conn.commit()
            except Exception as e:
                conn.rollback()
                print("error:")
                print(line)
                print(e)


def save_line(cur, uuid, timestamp, mail, country, ip, uri, action, tags):
    user_id = db.user.get_id(cur, mail)
    country_id = db.country.get_id(cur, country)
    uri_id = db.uri.get_id(cur, uri)
    action_id = db.action.get_id(cur, action)
    tag_ids = []
    tags = list(set(tags))  # removing duplicates
    for tag in tags:
        tag_ids.append(db.tag.get_id(cur, tag))
    event_id = db.event.create(cur, uuid, timestamp, user_id, country_id, ip, uri_id, action_id)
    db.tag.set_tag_event(cur, event_id, tag_ids)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "date", help="date of data to recover, format 'year-month'")
    args = parser.parse_args()
    date = args.date.split("-")
    parse_csv(*date)
