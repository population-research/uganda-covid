# Raw data

See main `README.md` for data access.
Each round should be a separate directory:

```
./raw_data
|-- external_data
|-- round1
|-- round2
|-- round3
|-- round4
|-- round5
|-- round6
|-- round7
|-- panel_15_16
|-- panel_18_19
|-- panel_19_20
```

The `external_data` contains the data from Google Mobility Reports
(Global_Mobility_Report.csv) and,
Our World in Data (owid-covid-data.csv) and Oxford University strigency 
index (OxCGRT_latest.csv).

The `panel_15_16` contains the 2015/16 panel data with all files in the
directory

The `panel_18_19` contains the 2018/19 panel data with the following
directories `Agric`, `Community`, `HH`, `Woman`, and the file `pov2018_19.dta`.

The `panel_19_20` contains the 2019/20 panel data with the following
directories `Agric`, `Community`, `HH`, `Woman`, and the file `pov2019_20.dta`.
These can be added by simply transferring the unzipped files from the
World Bank data.

