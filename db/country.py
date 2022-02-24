
def create(cur, country):
    cur.execute(
        "insert into country (name) values (%s) returning country_id", (country,))
    return cur.fetchone()[0]


def get_id(cur, country):
    cur.execute("select country_id from country where name = %s", (country,))
    try:
        country_id = cur.fetchone()[0]
    except TypeError:
        country_id = create(cur, country)
    return country_id

