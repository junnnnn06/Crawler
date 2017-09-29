import MySQLdb
conn = MySQLdb.connect(db = 'scraping', user = 'scraper', password = 'jun20952', charset = 'utf8mb4')
c = conn.cursor()
c.execute('DROP TABLE IF EXISTS cities')
c.execute('''
    CREATE TABLE cities(
        rank integer,
        city text,
        population integer
    )
''')
c.execute('INSERT INTO cities VALUES (%s, %s, %s)', (1, '上海', 24150000))

c.execute('INSERT INTO cities VALUES (%(rank)s, %(city)s, %(population)s)',{'rank': 2, 'city': 'カタチ', 'population': 23500000})

c.executemany('INSERT INTO cities VALUES (%(rank)s, %(city)s, %(population)s)',[
    {'rank': 3, 'city': '北京', 'population': 2151600},
    {'rank': 4, 'city': '天津', 'population': 1472210},
    {'rank': 5, 'city': 'イスタンブル', 'population': 1416947},
])

conn.commit()

c.execute('SELECT * from cities')
for row in c.fetchall():
    print(row)

conn.close()