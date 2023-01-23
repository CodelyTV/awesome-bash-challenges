# 🔥 Challenge

Generate 3 files:
1. categories.csv
    * Fields:
        * name
    * With no duplicates
2. sellers.csv
    * Fields:
        * id
        * name
    * With no duplicates
    * With no sellers without id
3. products.json
    * Fields
        * id (asin)
        * brand
        * price (final_price currency)
        * formats
            * name
            * price
        * publish_date (timestamp)
        * categories
    * Keeping only products in stock
