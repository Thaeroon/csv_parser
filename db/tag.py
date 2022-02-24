
def create(cur, tag):
    cur.execute(
        "insert into tag (name) values (%s) returning tag_id", (tag,))
    return cur.fetchone()[0]


def get_id(cur, tag):
    cur.execute("select tag_id from tag where name = %s", (tag,))
    try:
        tag_id = cur.fetchone()[0]
    except TypeError:
        tag_id = create(cur, tag)
    return tag_id


def set_tag_event(cur, event_id, tags):
    for tag in tags:
        cur.execute("insert into event_tag (event_id, tag_id) values (%s, %s)", (event_id, tag))