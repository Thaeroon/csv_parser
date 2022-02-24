
def create(cur, uuid, timestamp, user_id, country_id, ip, uri_id, action_id):
    cur.execute(
        """insert into event
            (event_id, timestamp, user_id, country_id, ip, uri_id, action_id)
            values (%s, %s, %s, %s, %s, %s, %s) returning event_id
        """,
        (uuid, timestamp, user_id, country_id, ip, uri_id, action_id))
    return cur.fetchone()[0]
