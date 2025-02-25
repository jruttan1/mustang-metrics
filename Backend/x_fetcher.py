import os
import re
import tweepy
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Retrieve API credentials
TWITTER_API_KEY = os.getenv("TWITTER_API_KEY")
TWITTER_API_SECRET = os.getenv("TWITTER_API_SECRET")
ACCESS_TOKEN = os.getenv("ACCESS_TOKEN")
ACCESS_TOKEN_SECRET = os.getenv("ACCESS_TOKEN_SECRET")
BEARER_TOKEN = os.getenv("BEARER_TOKEN")

# Specify the Twitter username to fetch tweets from
twitter_username = "WesternWeightRm"  

# Initialize Tweepy Client for API v2
client = tweepy.Client(
    bearer_token=BEARER_TOKEN,
    consumer_key=TWITTER_API_KEY,
    consumer_secret=TWITTER_API_SECRET,
    access_token=ACCESS_TOKEN,
    access_token_secret=ACCESS_TOKEN_SECRET,
    wait_on_rate_limit=True
)

def fetch_latest_occupancy():
    # Get the user ID for the username
    user_response = client.get_user(username=twitter_username)
    if user_response.data is None:
        print(f"No user found for username: {twitter_username}")
        return None, None
    user_id = user_response.data.id

    # Fetch the user's tweets using the v2 endpoint
    tweets_response = client.get_users_tweets(
        id=user_id,
        max_results=1,  # Fetch only the most recent tweet
        tweet_fields=["created_at"], 
        exclude=["retweets", "replies"]
    )

    if not tweets_response.data: 
        print("No tweets found for this user.")
        return None, None

    # Use the most recent tweet
    latest_tweet_text = tweets_response.data[0].text.strip()
    print("Fetched Tweet:\n", latest_tweet_text)

    # Define a regex pattern to capture each section's label and number
    pattern = r"(\S+)\s+(\d+)"
    matches = re.findall(pattern, latest_tweet_text)
    
    # Convert matches to a dictionary: {label: integer_value}
    occupancy_data = {label: int(number) for label, number in matches}
    
    # Calculate total occupancy by summing all values
    total_occupancy = sum(occupancy_data.values())
    
    return occupancy_data, total_occupancy

if __name__ == "__main__":
    occupancy, total = fetch_latest_occupancy()
    if occupancy:
        for section, count in occupancy.items():
            print(f"{section}: {count}")
        print("Total Occupancy:", total)