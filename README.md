# https://jhfoodmap.herokuapp.com/

## Local needs Zomato API key in db/zomato_key.rb
echo "ZOMATO_KEY = 'api_key'" > db/zomato_key.rb
from root of project directory, replacing api_key with your Zomato API key

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser
