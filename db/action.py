
def create(cur, action):
    cur.execute(
        "insert into action (name) values (%s) returning action_id", (action,))
    return cur.fetchone()[0]


def get_id(cur, action):
    cur.execute("select action_id from action where name = %s", (action,))
    try:
        action_id = cur.fetchone()[0]
    except TypeError:
        action_id = create(cur, action)
    return action_id

