# Lancer ce script pour initialiser la base de données

import sqlite3

# Création de la base de données

conn = sqlite3.connect('database.db')
c = conn.cursor()

# Exécution du script cards.sql 

with open('cards.sql', 'r') as f:
    sql = f.read()
    c.executescript(sql)

conn.commit()
conn.close()

