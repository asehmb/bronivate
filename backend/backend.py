from flask import Flask, jsonify
import firebase_admin
from firebase_admin import credentials, firestore, auth

app = Flask(__name__)

cred = credentials.Certificate(
    "bronivate-firebase-adminsdk-fbsvc-6097788006.json")
firebase_admin.initialize_app(cred)
db = firestore.client()


@app.route("/get", methods=["GET"])
def handle_get():
    quotes = [doc.to_dict() for doc in db.collection("quotes").stream()]
    print(quotes)
    return jsonify(quotes)


if __name__ == "__main__":
    app.run(debug=False)
