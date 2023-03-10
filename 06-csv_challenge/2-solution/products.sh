yq -p csv -o json 'map(
                    select(.availability == "In Stock.") |
                    {
                      "id": .asin,
                      "brand": .brand,
                      "price": (.final_price + " " + .currency),
                      "formats": (.format | map({"name": .name, "price": .price})),
                      "publish_date": .timestamp,
                      "categories": .categories
                    }
                )' _input.csv
