## 1. Country

| PK/FK | Atributo   | Tipo        | Restricciones |
|-----|------------|-------------|----------------|
| PK  | Code       | VARCHAR(4)  | NOT NULL |
|   — | Name       | VARCHAR(50) | UNIQUE, NOT NULL |
|   — | Capital    | VARCHAR(50) | — |
|   — | Province   | VARCHAR(50) | — |
|   — | Area       | DECIMAL     | CHECK (Area >= 0) |
|   — | Population | DECIMAL     | CHECK (Population >= 0) |

## 2. City

| PK/FK | Atributo   | Tipo        | Restricciones |
|-------|------------|-------------|----------------|
| PK    | Name       | VARCHAR(50) | NOT NULL |
| PK/FK | Country    | VARCHAR(4)  | NOT NULL |
| PK/FK | Province   | VARCHAR(50) | NOT NULL |
|   —    | Population | DECIMAL     | CHECK (Population >= 0) |
|   —    | Latitude   | DECIMAL     | CHECK (Latitude BETWEEN -90 AND 90) |
|   —    | Longitude  | DECIMAL     | CHECK (Longitude BETWEEN -180 AND 180) |
|   —    | Elevation  | DECIMAL     | — |

## 3. Province

| PK/FK | Atributo   | Tipo        | Restricciones |
|-------|------------|-------------|----------------|
| PK    | Name       | VARCHAR(50) | NOT NULL |
| PK/FK | Country    | VARCHAR(4)  | NOT NULL |
|   —   | Population | DECIMAL     | CHECK (Population >= 0) |
|   —   | Area       | DECIMAL     | CHECK (Area >= 0) |
|   —   | Capital    | VARCHAR(50) | — |
|   —    | CapProv    | VARCHAR(50) | — |

## 4. Economy

| PK/FK | Atributo    | Tipo        | Restricciones |
|-------|-------------|-------------|----------------|
| PK/FK | Country     | VARCHAR(4)  | NOT NULL |
|   —   | GDP         | DECIMAL     | CHECK (GDP >= 0) |
|   —   | Agriculture | DECIMAL     | — |
|   —   | Service     | DECIMAL     | — |
|   —   | Industry    | DECIMAL     | — |
|   —   | Inflation   | DECIMAL     | — |
|   —   | Unemployment| DECIMAL     | — |

## 5. Population

| PK/FK | Atributo         | Tipo       | Restricciones |
|-------|------------------|------------|----------------|
| PK/FK | Country          | VARCHAR(4) | NOT NULL |
|   —   | Population_Growth| DECIMAL    | — |
|   —    | Infant_Mortality | DECIMAL    | — |

## 6. Politics

| PK/FK | Atributo     | Tipo        | Restricciones |
|------|--------------|-------------|---------------|
| PK/FK | Country      | VARCHAR(4)  | NOT NULL      |
|   —  | Independence | DATE        | —             |
|   —  | WasDependent | VARCHAR(50) | —             |
| FK   | Dependent    | VARCHAR(4)  | —             |
|   —  | Government   | VARCHAR(120)| —             |

## 7. Religion

| PK/FK | Atributo   | Tipo        | Restricción                                           |
|-------|------------|-------------|-------------------------------------------------------|
| PK/FK | Country    | VARCHAR(4)  | PK (Name, Country) / FK → Country(Code)              |
| PK    | Name       | VARCHAR(50) | PK (Name, Country)                                    |
| —     | Percentage | DECIMAL     | CHECK (Percentage > 0 AND Percentage <= 100)         |

---

## 8. EthnicGroup

| PK/FK | Atributo   | Tipo        | Restricción                                           |
|-------|------------|-------------|-------------------------------------------------------|
| PK/FK | Country    | VARCHAR(4)  | PK (Name, Country) / FK → Country(Code)              |
| PK    | Name       | VARCHAR(50) | PK (Name, Country)                                    |
| —     | Percentage | DECIMAL     | CHECK (Percentage > 0 AND Percentage <= 100)         |

---

## 9. Language

| PK/FK | Atributo   | Tipo        | Restricción                                           |
|-------|------------|-------------|-------------------------------------------------------|
| PK/FK | Country    | VARCHAR(4)  | PK (Name, Country) / FK → Country(Code)              |
| PK    | Name       | VARCHAR(50) | PK (Name, Country)                                    |
| —     | Percentage | DECIMAL     | CHECK (Percentage > 0 AND Percentage <= 100)         |

---

## 10. Sublanguage

| PK/FK | Atributo | Tipo        | Restricción |
|-------|----------|-------------|-------------|
| PK    | Sublang  | VARCHAR(50) | —           |
| —     | Suplang  | VARCHAR(50) | —           |

---

## 11. Countrypops

| PK/FK | Atributo   | Tipo        | Restricción                      |
|-------|------------|-------------|----------------------------------|
| PK/FK | Country    | VARCHAR(4)  | FK → Country(Code)               |
| PK    | Year       | DECIMAL     | CHECK (Year ≥ 0)                 |
| —     | Population | DECIMAL     | CHECK (Population ≥ 0)           |

---

## 12. Countryothername

| PK/FK | Atributo  | Tipo        | Restricción |
|-------|-----------|-------------|-------------|
| PK/FK | Country   | VARCHAR(4)  | FK → Country(Code) |
| PK    | othername | VARCHAR(50) | —           |

---

## 13. Countrylocalname

| PK/FK | Atributo  | Tipo         | Restricción |
|-------|-----------|--------------|-------------|
| PK/FK | Country   | VARCHAR(4)   | FK → Country(Code) |
| —     | localname | VARCHAR(300) | —           |

## 14. Provpops

| PK/FK | Atributo   | Tipo        | Restricción                      |
|-------|------------|-------------|----------------------------------|
| PK/FK | Province   | VARCHAR(50) | FK → Province(Name, Country)     |
| PK/FK | Country    | VARCHAR(4)  | FK → Country(Code)               |
| PK    | Year       | DECIMAL     | CHECK (Year ≥ 0)                 |
| —     | Population | DECIMAL     | CHECK (Population ≥ 0)           |

---

## 15. Provinceothername

| PK/FK | Atributo   | Tipo        | Restricción                  |
|-------|------------|-------------|------------------------------|
| PK/FK | Province   | VARCHAR(50) | FK → Province(Name, Country) |
| PK/FK | Country    | VARCHAR(4)  | FK → Country(Code)           |
| PK    | othername  | VARCHAR(50) | —                            |

---

## 16. Provincelocalname

| PK/FK | Atributo  | Tipo         | Restricción                  |
|-------|-----------|--------------|------------------------------|
| PK/FK | Province  | VARCHAR(50)  | FK → Province(Name, Country) |
| PK/FK | Country   | VARCHAR(4)   | FK → Country(Code)           |
| —     | localname | VARCHAR(300) | —                            |

---

## 17. Citypops

| PK/FK | Atributo   | Tipo        | Restricción                    |
|-------|------------|-------------|--------------------------------|
| PK/FK | City       | VARCHAR(50) | FK → City(Name, Country, Province) |
| PK/FK | Country    | VARCHAR(4)  | FK → Country(Code)             |
| PK/FK | Province   | VARCHAR(50) | FK → Province(Name, Country)   |
| PK    | Year       | DECIMAL     | CHECK (Year ≥ 0)               |
| —     | Population | DECIMAL     | CHECK (Population ≥ 0)         |

---

## 18. Cityothername

| PK/FK | Atributo   | Tipo        | Restricción                    |
|-------|------------|-------------|--------------------------------|
| PK/FK | City       | VARCHAR(50) | FK → City(Name, Country, Province) |
| PK/FK | Country    | VARCHAR(4)  | FK → Country(Code)             |
| PK/FK | Province   | VARCHAR(50) | FK → Province(Name, Country)   |
| PK    | othername  | VARCHAR(50) | —                              |

---

## 19. Citylocalname

| PK/FK | Atributo  | Tipo         | Restricción                    |
|-------|-----------|--------------|--------------------------------|
| PK/FK | City      | VARCHAR(50)  | FK → City(Name, Country, Province) |
| PK/FK | Country   | VARCHAR(4)   | FK → Country(Code)             |
| PK/FK | Province  | VARCHAR(50)  | FK → Province(Name, Country)   |
| —     | localname | VARCHAR(300) | —                              |

## 20. Continent

| PK/FK | Atributo | Tipo        | Restricción |
|-------|----------|-------------|-------------|
| PK    | Name     | VARCHAR(20) | —           |
| —     | Area     | DECIMAL(10) | —           |

---

## 21. borders

| PK/FK | Atributo | Tipo       | Restricción                             |
|-------|----------|------------|-----------------------------------------|
| PK/FK | Country1 | VARCHAR(4) | FK → Country(Code)                      |
| PK/FK | Country2 | VARCHAR(4) | FK → Country(Code)                      |
| —     | Length   | DECIMAL    | CHECK (Length > 0)                      |

---

## 22. encompasses

| PK/FK | Atributo  | Tipo        | Restricción                              |
|-------|-----------|-------------|-------------------------------------------|
| PK/FK | Country   | VARCHAR(4)  | NOT NULL, FK → Country(Code)              |
| PK/FK | Continent | VARCHAR(20) | NOT NULL, FK → Continent(Name)            |
| —     | Percentage| DECIMAL     | CHECK (Percentage > 0 AND Percentage ≤ 100) |

---

## 23. Organization

| PK/FK | Atributo     | Tipo         | Restricción                          |
|-------|--------------|--------------|--------------------------------------|
| PK    | Abbreviation | VARCHAR(12)  | —                                    |
| —     | Name         | VARCHAR(100) | UNIQUE                               |
| —     | City         | VARCHAR(50)  | —                                    |
| FK    | Country      | VARCHAR(4)   | FK → Country(Code)                   |
| FK    | Province     | VARCHAR(50)  | FK → Province(Name, Country)         |
| —     | Established  | DATE         | —                                    |

---

## 24. isMember

| PK/FK | Atributo     | Tipo        | Restricción                         |
|-------|--------------|-------------|-------------------------------------|
| PK/FK | Country      | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Organization | VARCHAR(12) | FK → Organization(Abbreviation)     |
| —     | Type         | VARCHAR(60) | DEFAULT 'member'                    |

---

## 25. Mountain

| PK/FK | Atributo    | Tipo       | Restricción                                                                                                                 |
|-------|-------------|------------|-----------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | VARCHAR(50)| —                                                                                                                           |
| —     | Mountains   | VARCHAR(50)| —                                                                                                                           |
| —     | Elevation   | DECIMAL    | —                                                                                                                           |
| —     | Type        | VARCHAR(10)| —                                                                                                                           |
| —     | Coordinates | GeoCoord   | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

## 26. Desert

| PK/FK | Atributo    | Tipo     | Restricción                                                                                                               |
|-------|-------------|----------|---------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | VARCHAR(50) | —                                                                                                                        |
| —     | Area        | DECIMAL     | —                                                                                                                        |
| —     | Coordinates | GeoCoord    | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

---

## 27. Island

| PK/FK | Atributo    | Tipo        | Restricción                                                                                                               |
|-------|-------------|-------------|---------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | VARCHAR(50) | —                                                                                                                         |
| —     | Islands     | VARCHAR(50) | —                                                                                                                         |
| —     | Area        | DECIMAL     | CHECK (Area ≥ 0)                                                                                                          |
| —     | Elevation   | DECIMAL     | —                                                                                                                         |
| —     | Type        | VARCHAR(15) | —                                                                                                                         |
| —     | Coordinates | GeoCoord    | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

---

## 28. Lake

| PK/FK | Atributo    | Tipo        | Restricción                                                                                                               |
|-------|-------------|-------------|---------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | VARCHAR(50) | —                                                                                                                         |
| FK    | River       | VARCHAR(50) | FK → River(Name)                                                                                                         |
| —     | Area        | DECIMAL     | CHECK (Area ≥ 0)                                                                                                          |
| —     | Elevation   | DECIMAL     | —                                                                                                                         |
| —     | Depth       | DECIMAL     | CHECK (Depth ≥ 0)                                                                                                         |
| —     | Height      | DECIMAL     | CHECK (Height > 0)                                                                                                        |
| —     | Type        | VARCHAR(12) | —                                                                                                                         |
| —     | Coordinates | GeoCoord    | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

---

## 29. Sea

| PK/FK | Atributo | Tipo        | Restricción              |
|-------|----------|-------------|--------------------------|
| PK    | Name     | VARCHAR(50) | —                        |
| —     | Area     | DECIMAL     | CHECK (Area ≥ 0)         |
| —     | Depth    | DECIMAL     | CHECK (Depth ≥ 0)        |

---

## 30. River

| PK/FK | Atributo         | Tipo      | Restricción                                                                                                                                                                |
|-------|------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PK    | Name             | VARCHAR(50) | —                                                                                                                                                                           |
| FK    | River            | VARCHAR(50) | FK → River(Name) (autorreferencia)                                                                                                                                          |
| FK    | Lake             | VARCHAR(50) | FK → Lake(Name)                                                                                                                                                             |
| FK    | Sea              | VARCHAR(50) | FK → Sea(Name)                                                                                                                                                              |
| —     | Length           | DECIMAL     | CHECK (Length ≥ 0)                                                                                                                                                          |
| —     | Area             | DECIMAL     | CHECK (Area ≥ 0)                                                                                                                                                            |
| —     | Source           | GeoCoord    | CHECK ((Source.Latitude ≥ -90 AND Source.Latitude ≤ 90) AND (Source.Longitude > -180 AND Source.Longitude ≤ 180))                                                          |
| —     | Mountains        | VARCHAR(50) | —                                                                                                                                                                           |
| —     | SourceElevation  | DECIMAL     | —                                                                                                                                                                           |
| —     | Estuary          | GeoCoord    | CHECK ((Estuary.Latitude ≥ -90 AND Estuary.Latitude ≤ 90) AND (Estuary.Longitude > -180 AND Estuary.Longitude ≤ 180))                                                      |
| —     | EstuaryElevation | DECIMAL     | —                                                                                                                                                                           |
| —     | RivFlowsInto     | —           | CHECK ((River IS NULL AND Lake IS NULL) OR (River IS NULL AND Sea IS NULL) OR (Lake IS NULL AND Sea IS NULL))                                        |

---

## 31. RiverThrough

| PK/FK | Atributo | Tipo        | Restricción       |
|-------|----------|-------------|-------------------|
| PK/FK | River    | VARCHAR(50) | FK → River(Name)  |
| PK/FK | Lake     | VARCHAR(50) | FK → Lake(Name)   |

## 32. geo_Mountain

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Mountain | VARCHAR(50) | FK → Mountain(Name)                 |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 33. geo_Desert

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Desert   | VARCHAR(50) | FK → Desert(Name)                   |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 34. geo_Island

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Island   | VARCHAR(50) | FK → Island(Name)                   |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 35. geo_River

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | River    | VARCHAR(50) | FK → River(Name)                    |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 36. geo_Sea

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Sea      | VARCHAR(50) | FK → Sea(Name)                      |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 37. geo_Lake

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Lake     | VARCHAR(50) | FK → Lake(Name)                     |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

## 38. geo_Source

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | River    | VARCHAR(50) | FK → River(Name)                    |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 39. geo_Estuary

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | River    | VARCHAR(50) | FK → River(Name)                    |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                  |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)        |

---

## 40. mergesWith

| PK/FK | Atributo | Tipo        | Restricción                   |
|-------|----------|-------------|-------------------------------|
| PK/FK | Sea1     | VARCHAR(50) | FK → Sea(Name)                |
| PK/FK | Sea2     | VARCHAR(50) | FK → Sea(Name)                |

---

## 41. located

| PK/FK | Atributo | Tipo        | Restricción                             |
|-------|----------|-------------|-------------------------------------------|
| FK    | City     | VARCHAR(50) | FK → City(Name, Country, Province)        |
| FK    | Province | VARCHAR(50) | FK → Province(Name, Country)              |
| FK    | Country  | VARCHAR(4)  | FK → Country(Code)                        |
| FK    | River    | VARCHAR(50) | FK → River(Name)                          |
| FK    | Lake     | VARCHAR(50) | FK → Lake(Name)                           |
| FK    | Sea      | VARCHAR(50) | FK → Sea(Name)                            |

> *Nota:* Esta tabla no tiene PK definido explícitamente en el DDL.

---

## 42. locatedOn

| PK/FK | Atributo | Tipo        | Restricción                             |
|-------|----------|-------------|-------------------------------------------|
| PK/FK | City     | VARCHAR(50) | FK → City(Name, Country, Province)        |
| PK/FK | Province | VARCHAR(50) | FK → Province(Name, Country)              |
| PK/FK | Country  | VARCHAR(4)  | FK → Country(Code)                        |
| PK/FK | Island   | VARCHAR(50) | FK → Island(Name)                         |

---

## 43. islandIn

| PK/FK | Atributo | Tipo        | Restricción                   |
|-------|----------|-------------|-------------------------------|
| FK    | Island   | VARCHAR(50) | FK → Island(Name)             |
| FK    | Sea      | VARCHAR(50) | FK → Sea(Name)                |
| FK    | Lake     | VARCHAR(50) | FK → Lake(Name)               |
| FK    | River    | VARCHAR(50) | FK → River(Name)              |

> *Nota:* Igual que *located*, esta tabla no define PK en el DDL.

## 44. MountainOnIsland

| PK/FK | Atributo | Tipo        | Restricción                |
|-------|----------|-------------|----------------------------|
| PK/FK | Mountain | VARCHAR(50) | FK → Mountain(Name)        |
| PK/FK | Island   | VARCHAR(50) | FK → Island(Name)          |

---

## 45. LakeOnIsland

| PK/FK | Atributo | Tipo        | Restricción             |
|-------|----------|-------------|-------------------------|
| PK/FK | Lake     | VARCHAR(50) | FK → Lake(Name)         |
| PK/FK | Island   | VARCHAR(50) | FK → Island(Name)       |

---

## 46. RiverOnIsland

| PK/FK | Atributo | Tipo        | Restricción            |
|-------|----------|-------------|------------------------|
| PK/FK | River    | VARCHAR(50) | FK → River(Name)       |
| PK/FK | Island   | VARCHAR(50) | FK → Island(Name)      |

---

## 47. Airport

| PK/FK | Atributo  | Tipo         | Restricción                                                                 |
|-------|-----------|--------------|-----------------------------------------------------------------------------|
| PK    | IATACode  | VARCHAR(3)   | —                                                                           |
| —     | Name      | VARCHAR(100) | —                                                                           |
| FK    | Country   | VARCHAR(4)   | FK → Country(Code)                                                          |
| FK    | City      | VARCHAR(50)  | FK → City(Name, Country, Province)*                                         |
| FK    | Province  | VARCHAR(50)  | FK → Province(Name, Country)                                                |
| FK    | Island    | VARCHAR(50)  | FK → Island(Name)                                                           |
| —     | Latitude  | DECIMAL      | CHECK (Latitude ≥ -90 AND Latitude ≤ 90)                                    |
| —     | Longitude | DECIMAL      | CHECK (Longitude ≥ -180 AND Longitude ≤ 180)                                |
| —     | Elevation | DECIMAL      | —                                                                           |
| —     | gmtOffset | DECIMAL      | —                                                                           |

> *El FK hacia City requiere los tres atributos (Name, Country, Province), pero la tabla Airport sólo incluye "City", "Country", "Province", por lo cual la referencia es válida como combinación.*
