from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///transactions.db'
db = SQLAlchemy(app)

class Transaction(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    amount = db.Column(db.Float, nullable=False)
    date = db.Column(db.DateTime, nullable=False)
    description = db.Column(db.String(255), nullable=False)

    def to_dict(self):
        return {
            'id': self.id,
            'amount': self.amount,
            'date': self.date.isoformat(),
            'description': self.description
        }

#@app.before_first_request
#def create_tables():
#    db.create_all()
    
with app.app_context():
    db.create_all()

# API endpoint to add a transaction
@app.route('/transactions', methods=['POST'])
def add_transaction():
    data = request.get_json()
    date_object = datetime.strptime(data['date'], '%Y-%m-%d')
    new_transaction = Transaction(
        amount=data['amount'],
        date=date_object,
        description=data['description']
    )
    db.session.add(new_transaction)
    db.session.commit()
    return jsonify(new_transaction.to_dict()), 201

if __name__ == '__main__':
    app.run(debug=True)
