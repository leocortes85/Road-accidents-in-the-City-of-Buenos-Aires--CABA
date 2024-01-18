# DE: Verkehrsunfälle in der Stadt Buenos Aires (CABA)

![Python](https://img.shields.io/badge/Python-333333?style=flat&logo=python)
![Jupyter](https://img.shields.io/badge/-Jupyter_Notebook-333333?style=flat&logo=jupyter)
![Pandas](https://img.shields.io/badge/-Pandas-333333?style=flat&logo=pandas)
![Numpy](https://img.shields.io/badge/-Numpy-333333?style=flat&logo=numpy)
![Matplotlib](https://img.shields.io/badge/-Matplotlib-333333?style=flat&logo=matplotlib)
![Seaborn](https://img.shields.io/badge/-Seaborn-333333?style=flat&logo=seaborn)
![MySQL](https://img.shields.io/badge/-MySQL-333333?style=flat&logo=mysql)
![Powerbi](https://img.shields.io/badge/-PowerBI-333333?style=flat&logo=powerbi)
![VSC](https://img.shields.io/badge/Visual_Studio_Code-333333?style=flat&logo=visual%20studio%20code&logoColor=white)
![LaTeX](https://img.shields.io/badge/LaTeX-333333?style=flat-square&logo=LaTeX&logoColor=white)

# DE: Verkehrsunfälle in der Stadt Buenos Aires (CABA)

![Analyse](images/Siniestros_Viales.gif)

## Projektdarstellung

In diesem Projekt hat uns das Observatorium für Mobilität und Verkehrssicherheit (OMSV), ein Forschungszentrum, das dem Ministerium für Verkehr der Regierung der Autonomen Stadt Buenos Aires untersteht, gebeten, ein Datenanalyseprojekt vorzubereiten. Das Ziel ist es, Informationen zu generieren, die es den lokalen Behörden ermöglichen, Maßnahmen zu ergreifen, um die Anzahl der Todesfälle durch Verkehrsunfälle zu reduzieren. Hierfür stellen sie uns einen Datensatz zu Tötungsdelikten bei Verkehrsunfällen zur Verfügung, die in der Stadt Buenos Aires im Zeitraum 2016-2021 stattgefunden haben.

Steam ist eine digitale Vertriebsplattform für Videospiele mit über 325 Millionen Benutzern und bietet mehr als 25.000 Spiele in seinem Katalog an.

## Projektaufbau 

| Ordner/Datei              | Beschreibung                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| **/data**                | Ordner, der Datensätze und Dateien für die Analyse und das Dashboard speichert.                              |
| **/Notebooks**           | Ordner mit Jupyter Notebooks, die für den ETL- und EDA-Prozess verwendet werden. |
| **/Images**              | Ordner mit relevanten und veranschaulichenden Bildern für das Analyseprojekt. |
| **/Report**              | Ordner mit LaTex- und PDF-Dateien (in Englisch und Spanisch) mit einem Abschlussbericht über das Projekt.|
| **gitignore**            | Datei, die Ordner und Dateien angibt, die von der Versionskontrolle (Git) ignoriert werden sollen.                      |
| **LICENSE**              | MIT-LIZENZ - Datei, die die Bedingungen festlegt, unter denen der Quellcode geteilt wird.                 |
| **Siniestros_viales.sql**| Dimensionale Tabellen zur Erstellung eines relationalen Datenbankmodells in einem SQL-System.                            |
| **Siniestros_viales.pbix** | Dashboard mit visueller Analyse des Datensatzes. |
| **README.md**            | Hauptprojektdokumentation in Englisch.                                                         |
| **README_ESP.md**        | Hauptprojektdokumentation in Spanisch.                                                         |


## Transformationen und explorative Datenanalyse (EDA)

- Die Extraktion, Transformation und das Laden (ETL) wurden mit der Pandas-Bibliothek durchgeführt.
- Strategien wurden angewendet, um verschachtelte Daten zu handhaben, und irrelevante oder stark leere Spalten wurden entfernt.
- Die Tabellen "Facts" und "Victims" wurden durch einen 'merge' zusammengeführt, um eine einzige Tabelle mit allen relevanten Informationen zu erhalten.
- Informationen wurden von einer API bereitgestellt, die von der Regierung der Stadt Buenos Aires stammt und Informationen zu den Koordinaten jedes Viertels enthält, was zur Bildung einer neuen Spalte "Barrio" führte.
- Um die Informationen der geografischen Koordinaten in der API der Regierung der Stadt Buenos Aires zu respektieren, haben wir die Spalte 'Comuna' modifiziert und die Werte auf 'Comuna 0' gesetzt, wenn die Koordinaten keinem Viertel (Spalte 'Barrio') entsprechen.
- Während der Datenexploration haben wir Viertel gefunden, die nicht ihren jeweiligen Bezirken entsprachen. Um die Treue des geografischen Ortes zu bewahren, haben wir die Spalte 'Comuna' korrigiert, indem wir den Bezirk zuwiesen, zu dem jedes Viertel gehört, gemäß den Aufzeichnungen der Regierung von Buenos Aires.
- Mit Web-Scraping haben wir die Volkszählungsdaten der Stadt Buenos Aires heruntergeladen, um die Bevölkerungsdaten zu kennen, und dann haben wir das durchschnittliche jährliche Bevölkerungswachstum verwendet, um die Bevölkerung Jahr für Jahr zu schätzen.
- EDA wurde durchgeführt, um Datensätze mit Pandas, Matplotlib und Seaborn zu analysieren.
- Relevante Variablen wurden gefunden und ausgewählt, um die Analysen in der Dashboard-Präsentation durchzuführen, mit dem Ziel, den Fall zu einer korrekten Entscheidungsfindung zu führen.
- Die Datenanalyse wurde in drei Sätze unterteilt (Analyse nach zeitlichen Variablen, Analyse nach geografischen Variablen und Analyse nach Opfern) für eine bessere Ordnung und Verständnis der im Datensatz enthaltenen Informationen im Hinblick auf das Ziel, ideale Leistungsindikatoren zu bewerten, um korrekte Entscheidungen zu treffen.

## Dimensionale Tabellen und relationales Modell

- Mit den während der Analyse ausgewählten Variablen wurde ein relationales Modell mit Hilfstabellen und einer Haupttabelle erstellt, um die Informationen zu organisieren und leicht darauf zuzugreifen.
- Das relationale Modell wurde durch


