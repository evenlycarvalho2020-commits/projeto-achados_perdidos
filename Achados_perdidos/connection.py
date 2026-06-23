import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="734inf0",
        database="achados_perdidos"
    )