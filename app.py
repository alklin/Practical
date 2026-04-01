from flask import Flask, Response
import pyodbc
import json

app = Flask("app")

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost;'
    'DATABASE=WebAppDB;'
    'Trusted_Connection=yes;'
)
#conn.setdecoding(pyodbc.SQL_CHAR, encoding='cp1251')
#conn.setdecoding(pyodbc.SQL_WCHAR, encoding='utf-16le')

@app.route('/')
def get_products():
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Products")

    rows = []
    for row in cursor.fetchall():
        rows.append({
            "Id": row[0],
            "Name": row[1],
            "Price": float(row[2])
        })
        
    return Response(
        json.dumps(rows, ensure_ascii=False, indent=2),
        mimetype='application/json; charset=utf-8'
        )
        

if True:
    app.run(debug=True)