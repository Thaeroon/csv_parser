
def create(cur, domain):
    cur.execute(
        "insert into domain (name) values (%s) returning domain_id", (domain,))
    return cur.fetchone()[0]


def get_id(cur, domain):
    cur.execute("select domain_id from domain where name = %s", (domain,))
    try:
        domain_id = cur.fetchone()[0]
    except TypeError:
        domain_id = create(cur, domain)
    return domain_id

