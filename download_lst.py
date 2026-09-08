import cdsapi
from pathlib import Path

client = cdsapi.Client()

output_dir = Path("data_raw/LST")
output_dir.mkdir(parents=True, exist_ok=True)

years = ["2021", "2022", "2023", "2024"]
months = {
    "06": "June",
    "07": "July",
    "08": "August",
}

for year in years:
    for month_num, month_name in months.items():
        target = output_dir / f"LST_{year}_{month_name}.nc"

        request = {
            "variable": ["land_surface_temperature"],
            "observation_time": ["day"],
            "year": [year],
            "month": [month_num],
            "version": ["v3_00"],
            "area": [53, -10, 37, 25],
        }

        print(f"Downloading {month_name} {year}...")

        client.retrieve(
            "satellite-land-surface-temperature",
            request
        ).download(str(target))

        print(f"Saved: {target}")

print("All downloads completed.")