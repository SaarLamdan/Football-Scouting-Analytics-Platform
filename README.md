# Football Scouting Analytics Platform
Project Overview
This project delivers a comprehensive 360 degree player evaluation and recruitment platform for professional football scouting departments. The dashboard bridges technical data architecture with scout-level insights, focusing on recruitment optimization, player efficiency normalization, and financial market value trends.

**Dashboard Preview**
[Insert your dashboard screenshots here]

**Business Insights and Key Takeaways**
Efficiency vs. Volume (Per 90 Metrics): Analyzing raw volume metrics can skew a scout's assessment due to varying playing time. Normalizing performance data to per 90 minute intervals uncovers highly efficient prospects who produce elite output despite limited minutes or tactical constraints, minimizing recruitment blind spots.

Market Value Volatility: Monitoring chronological valuation trajectories alongside player career highs allows recruitment teams to identify optimal buy low windows before market spikes occur. Tracking historical fluctuations isolates whether an athlete is on a steady developmental path or experiencing a transient dip in valuation.

Career Lifecycle and Roster Tracking: Integrating dynamic player status tracking isolates active performers from legacy data points. Automatically detecting inactive or retired statuses prevents resource misallocation and administrative overhead, ensuring the recruitment pipeline focuses strictly on viable transfer targets.

**Technical Skills Demonstrated**
Data Pipeline and Preparation (Python)
Developed an ETL pipeline using Pandas to ingest multiple raw football datasets including players, appearances, clubs, competitions, valuations, and transfers. Cleaned structural data anomalies, handled missing performance metrics, standardized datetime formats, handled missing market values, and performed chronological sorting by player identifiers to output structured datasets optimized for relational consumption.

Advanced Data Querying (SQL)
Wrote complex relational queries to extract target scouting profiles from the cleaned data warehouse. Applied window functions such as LAG OVER to calculate localized market value changes over time, integrated conditional NULLIF aggregation structures to prevent zero-division errors when calculating goal involvement per minute, and executed multi table joins to isolate specific tactical subsets, such as attacking profiles within defined valuation parameters and performance thresholds.

Data Modeling and DAX (Power BI)
Designed an optimized data model utilizing calculated tables and controlled bi-directional filtering channels to secure data integrity across unrelated fact tables. Developed advanced DAX measures to support executive reporting, including time sensitive per 90 metrics, multi variable logic to calculate dynamic active statuses, and context aware filters to constrain visualization layers without compromising query performance.

Dashboard Design and UX
Architected a dark mode analytics interface optimized for rapid cognitive processing by sporting directors and scouts. Structured the interface into dedicated performance zones, allowing decision makers to evaluate core efficiency indicators, career valuation trends, historical club allocations, and interactive, cross filtered geographical maps within seconds.

Data Source
The dataset utilized in this project covers global football analytics encompassing player historical records, individual match appearance logs, historical market valuations, and club competition metadata configured for relational database deployment.
