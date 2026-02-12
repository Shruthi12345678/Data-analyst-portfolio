import streamlit as st
import pickle
import re
import nltk

from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer

model = pickle.load(open("../sentiment_model_binary.pkl", "rb"))
vectorizer = pickle.load(open("../sentiment_vectorizer_binary.pkl", "rb"))
encoder = pickle.load(open("../label_encoder.pkl", "rb"))


# NLP Processing setup

stop_words = set(stopwords.words("english"))
lemmatizer = WordNetLemmatizer()

def preprocess_text(text):
    text = text.lower()
    tokens = word_tokenize(text)
    tokens = [w for w in tokens if w not in stop_words]
    tokens = [lemmatizer.lemmatize(w) for w in tokens]
    return " ".join(tokens)


# APP UI

st.title("Amazon Review Sentiment Predictor")
st.write("Enter a Product Review and Get Predicted Sentiment")

user_input = st.text_area("Enter Review")

if st.button("Predict Sentiment"):

    cleaned = preprocess_text(user_input)
    vectorized = vectorizer.transform([cleaned])
    preds = model.predict(vectorized)[0]
    st.subheader("Prediction: ")
    success_sentiment = "Positive" if preds==2 else "Negative"
    st.success(success_sentiment)
