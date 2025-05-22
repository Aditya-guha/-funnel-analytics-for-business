# Customer Journey Analytics & Funnel Optimization

Customer Journey Analytics & Funnel Optimization is a data-driven decision support tool built with Streamlit, Python, and SQL, aimed at helping eCommerce and SaaS teams understand user behavior, detect bottlenecks in the funnel, and optimize for higher conversions.

Developed by Aditya Guha Roy 

## Key Features

- Upload CSVs of customer journey logs
- SQL-based Funnel Stage Analysis
  - Stage counts
  - Drop-off rates
  - Device-wise heatmap
  - Time-to-convert metrics
- Interactive Visualizations with Plotly
- Automated Data Cleaning and Validation
- Insightful Metrics on Session Behavior
- Funnel Drop-off Analyzer with Downloadable Results

## Tech Stack

| Tool       | Purpose                                  |
|------------|-------------------------------------------|
| Streamlit  | Interactive web app interface             |
| Pandas     | Data preprocessing and transformation     |
| NumPy      | Statistical operations                    |
| Plotly     | Visualizations and interactive charts     |
| SQL        | Funnel logic and behavioral analytics     |
| Python     | Core backend logic and orchestration      |

## Folder Structure
customer-funnel-optimizer/
├── app.py # Main Streamlit app
├── Dataset.csv # Sample customer journey data
├── funnel_analysis_queries.sql # SQL logic for funnel stages
└── Customer_Journey_Analytics_and_Funnel_Optimization.ipynb # EDA + visualizations


## Sample Use Case

1. Upload your Dataset.csv which includes events like:
   - Visit, ProductView, SignUp, AddToCart, Purchase
2. The app:
   - Cleans and validates the data
   - Runs SQL-based funnel stage analysis
   - Visualizes:
     - Drop-offs by stage
     - Time between stages
     - Device-wise activity
3. View downloadable insights and AI-based recommendations

## How to Run

### 1. Install Dependencies

pip install streamlit pandas numpy plotly

### 2. Launch the App
streamlit run app.py

###SQL Logic Highlights
Stage Conversion Count
Drop-off % Between Stages
Average Time Between Events
Device-wise Drop-off Heatmap
All logic is in funnel_analysis_queries.sql

###Sample Visualizations
Funnel chart with conversion rates
Heatmap for device-based behavior
Bar charts for time between funnel stages
