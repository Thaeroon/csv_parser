
def create(cur, uri):
    cur.execute(
        "insert into uri (name) values (%s) returning uri_id", (uri,))
    return cur.fetchone()[0]


def get_id(cur, uri):
    cur.execute("select uri_id from uri where name = %s", (uri,))
    try:
        uri_id = cur.fetchone()[0]
    except TypeError:
        uri_id = create(cur, uri)
    return uri_id

