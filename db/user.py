from . import domain

def create(cur, mail):
    domain_id = domain.get_id(cur, mail.split("@")[1])
    cur.execute(
        "insert into \"user\" (mail, domain_id) values (%s, %s) returning user_id", (mail, domain_id))
    return cur.fetchone()[0]


def get_id(cur, mail):
    cur.execute("select user_id from \"user\" where mail = %s", (mail,))
    try:
        user_id = cur.fetchone()[0]
    except TypeError:
        user_id = create(cur, mail)
    return user_id