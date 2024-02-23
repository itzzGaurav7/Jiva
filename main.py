from flask import Flask, request, jsonify, render_template
import pickle
import pandas as pd
from pydantic import BaseModel
import pandas as pd
app = Flask(__name__)

model = pickle.load(open('LGBM.pkl', 'rb'))
model1 = pickle.load(open('LGBM1.pkl', 'rb'))
model2 = pickle.load(open('LGBM2.pkl','rb'))


class Scoringitem(BaseModel):
    Age:int
    Gender_Female: bool
    Gender_Male : bool
    Polyuria_No : bool
    Polyuria_Yes: bool
    Polydipsia_No: bool
    Polydipsia_Yes : bool
    suddenweightloss_No: bool
    suddenweightloss_Yes : bool
    weakness_No: bool
    weakness_Yes: bool
    Polyphagia_No: bool
    Polyphagia_Yes: bool
    Genitalthrush_No: bool
    Genitalthrush_Yes: bool
    visualblurring_No: bool
    visualblurring_Yes: bool
    Itching_No: bool
    Itching_Yes: bool
    Irritability_No: bool
    Irritability_Yes: bool
    delayedhealing_No : bool
    delayedhealing_Yes: bool
    partialparesis_No: bool
    partialparesis_Yes: bool
    musclestiffness_No: bool
    musclestiffness_Yes: bool
    Alopecia_No: bool
    Alopecia_Yes: bool
    Obesity_No : bool
    Obesity_Yes: bool
    
@app.route('/')
def home():
    return render_template('home.html')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.form.to_dict()
    
    # Ensure all features are present
    for feature in Scoringitem.__annotations__.keys():
        if feature not in data:
            return render_template('home.html', prediction_text="Missing feature: {}".format(feature))
    
    final_features = pd.DataFrame([list(data.values())], columns=list(data.keys()))
    yhat1 = model.predict(final_features)
    yhat2 = model1.predict(final_features)
    yhat3 = model2.predict(final_features)
    yhat = (yhat1 + yhat2 + yhat3) / 3.0
   
    return render_template('home.html', prediction_text="Do you have diabetes: {}".format(yhat[0]))


if __name__ == "__main__":
    app.run(debug=True)
#git remote add origin https://github.com/your-username/your-repo.git
#git branch -M main  # If you're using a branch other than master
#git push -u origin main  # If you're using a branch other than master