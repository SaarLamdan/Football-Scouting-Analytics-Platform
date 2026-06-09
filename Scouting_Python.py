import pandas as pd
import os

DATA_PATH = r"C:\Users\סער\Desktop\Scouting_Project\Data"

df_players = pd.read_csv(os.path.join(DATA_PATH, "players.csv"))
df_appearances = pd.read_csv(os.path.join(DATA_PATH, "appearances.csv"))
df_clubs = pd.read_csv(os.path.join(DATA_PATH, "clubs.csv"))
df_competitions = pd.read_csv(os.path.join(DATA_PATH, "competitions.csv"))
df_valuations = pd.read_csv(os.path.join(DATA_PATH, "player_valuations.csv"))
df_transfers = pd.read_csv(os.path.join(DATA_PATH, "transfers.csv"))

df_players = df_players[df_players['last_season'] == 2025]
df_players = df_players[df_players['current_club_id'].notna()]

df_players['market_value_in_eur'] = df_players['market_value_in_eur'].fillna(0)
df_players['highest_market_value_in_eur'] = df_players['highest_market_value_in_eur'].fillna(0)

df_players = df_players.sort_values(by='player_id', ascending=True)

df_appearances['date'] = pd.to_datetime(df_appearances['date'])

perf_col = ['goals' , 'assists' , 'minutes_played' , 'yellow_cards' , 'red_cards']
for col in perf_col:
    if col in df_appearances:
        df_appearances[col] = df_appearances[col].fillna(0)
        
df_appearances = df_appearances.sort_values(by=['player_id', 'date'], ascending=[True, True])

df_valuations['date'] = pd.to_datetime(df_valuations['date'])
df_valuations['market_value_in_eur'] = df_valuations['market_value_in_eur'].fillna(0)
df_valuations = df_valuations.sort_values(by=['player_id', 'date'], ascending=[True, True])

df_transfers['transfer_date'] = pd.to_datetime(df_transfers['transfer_date'])
df_transfers['transfer_fee'] = df_transfers['transfer_fee'].fillna(0)
df_transfers = df_transfers.sort_values(by=['player_id', 'transfer_date'], ascending=[True, True])

df_clubs = df_clubs.sort_values(by='club_id', ascending=True)
df_competitions = df_competitions.sort_values(by='competition_id', ascending=True)

OUTPUT_PATH = os.path.join(DATA_PATH, "Cleaned")
os.makedirs(OUTPUT_PATH, exist_ok=True)

df_players.to_csv(os.path.join(OUTPUT_PATH, "players_cleaned.csv"), index=False)
df_appearances.to_csv(os.path.join(OUTPUT_PATH, "appearances_cleaned.csv"), index=False)
df_clubs.to_csv(os.path.join(OUTPUT_PATH, "clubs_cleaned.csv"), index=False)
df_competitions.to_csv(os.path.join(OUTPUT_PATH, "competitions_cleaned.csv"), index=False)
df_valuations.to_csv(os.path.join(OUTPUT_PATH, "valuations_cleaned.csv"), index=False)
df_transfers.to_csv(os.path.join(OUTPUT_PATH, "transfers_cleaned.csv"), index=False)