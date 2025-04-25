import mysql.connector
import os
from flask import Flask
from flask import render_template
from urllib.parse import urlparse

app = Flask(__name__)

@app.route("/")
def hello():
    return render_template('index.html')

@app.route("/users")
def get_users():
    mysqlUrl = os.getenv("SCALINGO_MYSQL_URL")
    dbc = urlparse(mysqlUrl)
    conn = mysql.connector.connect(
        database=dbc.path.lstrip('/'),
        user=dbc.username,
        password=dbc.password,
        port=dbc.port, 
        host=dbc.hostname
    )
    cursor = conn.cursor()
    sql_select_Query = "select * from users"
    cursor.execute(sql_select_Query)
    # get all records
    records = cursor.fetchall()
    print("Total number of rows in table: ", cursor.rowcount)
    # renvoyer nos données et 200 code OK
    return {'users': records}

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)

    