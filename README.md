Customer Journey Analytics & Funnel Optimization is a data-driven decision support tool built with Streamlit, Python, and SQL, aimed at helping eCommerce and SaaS teams understand user behavior, detect bottlenecks in the funnel, and optimize for higher conversions.


Key Features
Upload CSVs of customer journey logs

SQL-based Funnel Stage Analysis

Stage counts

Drop-off rates

Device-wise heatmap

Time-to-convert metrics

Interactive Visualizations with Plotly

Automated Data Cleaning and preprocessing

Insightful Metrics on session behavior

Funnel Drop-off Analyzer with downloadable results

Tech Stack
Tool	Purpose
Streamlit	Interactive web app interface
Pandas	Data preprocessing and transformation
NumPy	Statistical operations
Plotly	Visualizations and interactive charts
SQL	Funnel logic and analytics
Python	Backend orchestration and insights

Folder Structure

customer-funnel-optimizer/
├── app.py                  # Main Streamlit app
├── Dataset.csv             # Sample customer journey data
├── funnel_analysis_queries.sql # SQL logic for funnel stages
├── Customer_Journey_Analytics_and_Funnel_Optimization.ipynb # EDA + visualizations
Sample Use Case
Upload your Dataset.csv which includes events like Visit, ProductView, SignUp, AddToCart, and Purchase.

The app:

Cleans and validates the data

Executes embedded SQL logic for funnel analytics

Visualizes:

Drop-offs

Time between events

Device-wise engagement

Input your business KPIs to see actionable insights.

How to Run
1. Install Requirements
pip install -r requirements.txt
Minimal dependencies:

pip install streamlit pandas numpy plotly
Run the App

streamlit run app.py
SQL Logic Highlights
Stage Conversion Count

Drop-off % Between Stages

Time Between Events

Device-wise Drop-off Heatmap

You can find all logic in: funnel_analysis_queries.sql

Sample Visualization
Funnel chart with conversion rates

Heatmaps for device behavior

Bar charts for average transition times

About the Developer
Aditya Guha Roy
MBA in Business Analytics – OP Jindal Global University
IBM ALP 2025 Program Participant

