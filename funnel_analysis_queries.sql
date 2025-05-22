
-- 📊 Funnel Stage Count
SELECT event, COUNT(DISTINCT session_id) AS session_count
FROM customer_journey
WHERE event IN ('Visit', 'ProductView', 'SignUp', 'AddToCart', 'Purchase')
GROUP BY event
ORDER BY CASE event
  WHEN 'Visit' THEN 1
  WHEN 'ProductView' THEN 2
  WHEN 'SignUp' THEN 3
  WHEN 'AddToCart' THEN 4
  WHEN 'Purchase' THEN 5
END;

-- 📉 Drop-off Between Funnel Stages
WITH stage_flags AS (
  SELECT session_id,
    MAX(CASE WHEN event = 'Visit' THEN 1 ELSE 0 END) AS Visit,
    MAX(CASE WHEN event = 'ProductView' THEN 1 ELSE 0 END) AS ProductView,
    MAX(CASE WHEN event = 'SignUp' THEN 1 ELSE 0 END) AS SignUp,
    MAX(CASE WHEN event = 'AddToCart' THEN 1 ELSE 0 END) AS AddToCart,
    MAX(CASE WHEN event = 'Purchase' THEN 1 ELSE 0 END) AS Purchase
  FROM customer_journey
  GROUP BY session_id
)
SELECT
  'Visit → ProductView' AS stage,
  SUM(Visit) AS from_stage,
  SUM(ProductView) AS to_stage,
  ROUND(100.0 * (1 - SUM(ProductView)*1.0 / SUM(Visit)), 2) AS dropoff_rate
UNION ALL
SELECT
  'ProductView → SignUp',
  SUM(ProductView), SUM(SignUp),
  ROUND(100.0 * (1 - SUM(SignUp)*1.0 / SUM(ProductView)), 2)
FROM stage_flags
UNION ALL
SELECT
  'SignUp → AddToCart',
  SUM(SignUp), SUM(AddToCart),
  ROUND(100.0 * (1 - SUM(AddToCart)*1.0 / SUM(SignUp)), 2)
FROM stage_flags
UNION ALL
SELECT
  'AddToCart → Purchase',
  SUM(AddToCart), SUM(Purchase),
  ROUND(100.0 * (1 - SUM(Purchase)*1.0 / SUM(AddToCart)), 2)
FROM stage_flags;

-- ⏱️ Average Time Between Funnel Events
WITH ranked_events AS (
  SELECT
    session_id,
    event,
    timestamp,
    LEAD(event) OVER (PARTITION BY session_id ORDER BY timestamp) AS next_event,
    LEAD(timestamp) OVER (PARTITION BY session_id ORDER BY timestamp) AS next_timestamp
  FROM customer_journey
  WHERE event IN ('Visit', 'ProductView', 'SignUp', 'AddToCart', 'Purchase')
),
durations AS (
  SELECT
    event,
    TIMESTAMPDIFF(MINUTE, timestamp, next_timestamp) AS duration_min
  FROM ranked_events
  WHERE next_timestamp IS NOT NULL
)
SELECT
  event,
  ROUND(AVG(duration_min), 2) AS avg_time_to_next_stage_min
FROM durations
GROUP BY event;

-- 📱 Drop-offs by Device (Heatmap Preparation)
SELECT
  device,
  event,
  COUNT(*) AS dropoff_count
FROM (
  SELECT
    session_id,
    event,
    device,
    ROW_NUMBER() OVER (PARTITION BY session_id ORDER BY timestamp) AS rn
  FROM customer_journey
) AS ranked
WHERE event IN ('Visit', 'ProductView', 'SignUp', 'AddToCart', 'Purchase')
GROUP BY device, event;
