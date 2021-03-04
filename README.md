# Homework 07

## Part 1 Queries
### 1) DESCRIBE your table(s)
DESCRIBE Course;

```
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| courseNumber | varchar(25) | NO   | PRI | NULL    |       |
| courseName   | varchar(45) | NO   |     | NULL    |       |
| Professor(s) | varchar(45) | NO   |     | NULL    |       |
| Cancelled    | varchar(45) | NO   |     | NULL    |       |
| Office_Hours | varchar(45) | NO   |     | NULL    |       |
| Meet_Time    | varchar(45) | NO   |     | NULL    |       |
| Room         | varchar(45) | NO   |     | NULL    |       |
| Semester     | varchar(45) | NO   | PRI | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
```


### 2) show the first few rows
SELECT * FROM Course LIMIT 10;

```
+-----------------+-----------------------------------+---------------------+-----------+--------------+---------------+------------------+------------+
| courseNumber    | courseName                        | Professor           | Cancelled | Office_Hours | Meet_Time     | Room             | Semester   |
+-----------------+-----------------------------------+---------------------+-----------+--------------+---------------+------------------+------------+
| CSCI-GA.1133001 | PAC I*                            | Evan Korth          | NO        | YES          | T 6:30-9:00PM | ONLINE           | FALL2020   |
| CSCI-GA.1133002 | PAC I Recitation                  | Nolan Filter        | NO        | NO           | W 6:10-7:00PM | ONLINE           | FALL2020   |
| CSCI-GA.1133003 | PAC I Recitation                  | NULL                | YES       | NULL         | NULL          | NULL             | FALL2020   |
| CSCI-GA.1144001 | PAC II*                           | Mohamed Zahran      | NULL      | YES          | T 6:00-8:30PM | CIWW 312         | SPRING2020 |
| CSCI-GA.1144002 | PAC II Recitation                 | Rutviben Malaviya   | NULL      | NO           | R 7:10-8:00PM | CIWW 312         | SPRING2020 |
| CSCI-GA.1170001 | Fundamental Algorithms            | Richard  Cole       | NO        | YES          | T 5:10-7:00PM | ONLINE           | FALL2020   |
| CSCI-GA.1170001 | Fundamental Algorithms            | Chee Yap            | NULL      | YES          | M 5:10-7:00PM | 60 Fifth Ave 110 | SPRING2020 |
| CSCI-GA.1170002 | Fundamental Algorithms Recitation | Harish Karthikeyan  | NO        | NO           | R 5:10-6:00PM | CIWW 109         | FALL2020   |
| CSCI-GA.1170002 | Fundamental Algorithms Recitation | Abhinav Tamaskar    | NULL      | NO           | W 5:10-6:00PM | CIWW 101         | SPRING2020 |
| CSCI-GA.1170003 | Fundamental Algorithms            | Alexander Alekseyev | NO        | YES          | W 5:10-7:00PM | ONLINE           | FALL2020   |
+-----------------+-----------------------------------+---------------------+-----------+--------------+---------------+------------------+------------+
```

### 3) show all fall courses that got cancelled
SELECT * FROM Course WHERE Cancelled = "YES" AND Semester = "FALL2020";

```
+-----------------+-----------------------------------------------+--------------+-----------+--------------+-----------+------+----------+
| courseNumber    | courseName                                    | Professor    | Cancelled | Office_Hours | Meet_Time | Room | Semester |
+-----------------+-----------------------------------------------+--------------+-----------+--------------+-----------+------+----------+
| CSCI-GA.1133003 | PAC I Recitation                              | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.1170007 | Fundamental Algorithms Recitation             | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2110004 | Programming Languages Recitation              | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2110005 | Programming Languages Recitation              | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2630001 | Foundations of Networks and Mobile Systems*   | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2630002 | Foundations of Networks and Mobile Systems La | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2810001 | Design and Innovation*                        | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2810002 | Design and Innovation Lab*                    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.2945002 | Advanced Topics In Numerical Analysis: Numeri | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.3033046 | Special Topics: Statistical Natural Language  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-GA.3033076 | Special Topics: Vision Meets Machine Learning | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0002010 | Intro To Computer Programming (No Prior Exper | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0101002 | Intro To Computer Science                     | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0101009 | Intro To Computer Science                     | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0102009 | Data Structures - Recitation                  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0102014 | Data Structures - Recitation                  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0102015 | Data Structures - Recitation                  | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201011 | Computer Systems Organization - Recitation    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201013 | Computer Systems Organization - Recitation    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201016 | Computer Systems Organization - Recitation    | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0201017 | Computer Systems Organization                 | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
| CSCI-UA.0480053 | Special Topics: iOS Programming               | NULL         | YES       | NULL         | NULL      | NULL | FALL2020 |
+-----------------+-----------------------------------------------+--------------+-----------+--------------+-----------+------+----------+
```

### 4) show the number of courses taught by professor versoza in spring and fall 
SELECT Professor, COUNT(courseNumber) AS num_of_courses FROM Course WHERE Professor LIKE '%Versoza%';

```
+----------------+----------------------+
| Professor      | num_of_courses       |
+----------------+----------------------+
| Joseph Versoza |                    6 |
+----------------+----------------------+
```

## Part 2 Using an API

### Link to API documentation
https://github.com/harvardartmuseums/api-docs

### Request Method and Paths of API URLs Used
HTTP Request Method that will be used: GET

Path of API URLS used: https://api.harvardartmuseums.org/object/304069?apikey=035c9715-9613-4438-a673-b158e85f0f67

### Example Format of Response
All data is in JSON format. Here is a typical response:
```
// 20201119062504
// https://api.harvardartmuseums.org/object/304069?apikey=035c9715-9613-4438-a673-b158e85f0f67

{
  "objectid": 304069,
  "objectnumber": "1949.89",
  "accessionyear": 1949,
  "dated": "late 5th century BCE",
  "datebegin": -430,
  "dateend": -400,
  "classification": "Vessels",
  "classificationid": 57,
  "medium": "Bronze, traces of silvering and possible gilding",
  "technique": "Cast, lost-wax process",
  "techniqueid": 1311,
  "period": "Classical period, High",
  "periodid": 416,
  "century": "5th century BCE",
  "culture": "Greek",
  "style": null,
  "signed": null,
  "state": null,
  "edition": null,
  "standardreferencenumber": null,
  "dimensions": "h. 41.9 cm x diam. 28.5 cm (37 cm in diam. with handles) (16 1/2 x 11 1/4 in.; 14 9/16 in diam. with handles)",
  "copyright": null,
  "creditline": "Harvard Art Museums/Arthur M. Sackler Museum, Grace Nichols Strong Memorial Fund",
  "department": "Department of Ancient and Byzantine Art & Numismatics",
  "division": "Asian and Mediterranean Art",
  "contact": "am_asianmediterranean@harvard.edu",
  "description": null,
  "provenance": "John Edward Taylor Collection, London, (by 1912). [Christie’s, July 1, 1912, lot 367]. H. Oppenheimer collection, London, sold; [through Christie’s, London, July 22-23, 1936, lot 126]; sold; [to the International Studio Art Corp. (William Randolph Hearst), Oct. 24, 1940], sold; [through J. Brummer Gallery, New York, 1940-1949, inv. no. N4736], sold; to Fogg Art Museum, 1949.",
  "commentary": null,
  "labeltext": null,
  "imagecount": 5,
  "mediacount": 0,
  "colorcount": 9,
  "markscount": 0,
  "peoplecount": 0,
  "titlescount": 1,
  "publicationcount": 12,
  "exhibitioncount": 4,
  "contextualtextcount": 1,
  "groupcount": 3,
  "relatedcount": 0,
  "totalpageviews": 907,
  "totaluniquepageviews": 754,
  "dateoffirstpageview": "2009-06-03",
  "dateoflastpageview": "2020-11-14",
  "verificationlevel": 4,
  "verificationleveldescription": "Best. Object is extensively researched, well described and information is vetted",
  "imagepermissionlevel": 0,
  "lendingpermissionlevel": 0,
  "accesslevel": 1,
  "accessionmethod": "Purchase",
  "rank": 154,
  "url": "https://www.harvardartmuseums.org/collections/object/304069",
  "id": 304069,
  "lastupdate": "2020-11-18T05:33:45-0500",
  "colors": [
    {
      "color": "#c8c8c8",
      "spectrum": "#8c5fa8",
      "hue": "Grey",
      "percent": 0.43642857142857144,
      "css3": "#c0c0c0"
    },
    {
      "color": "#afafaf",
      "spectrum": "#8c5fa8",
      "hue": "Grey",
      "percent": 0.18648809523809523,
      "css3": "#a9a9a9"
    },
    {
      "color": "#323232",
      "spectrum": "#2eb45d",
      "hue": "Grey",
      "percent": 0.12791666666666668,
      "css3": "#2f4f4f"
    },
    {
      "color": "#4b4b4b",
      "spectrum": "#3db657",
      "hue": "Grey",
      "percent": 0.09232142857142857,
      "css3": "#2f4f4f"
    },
    {
      "color": "#646464",
      "spectrum": "#7866ad",
      "hue": "Grey",
      "percent": 0.06303571428571429,
      "css3": "#696969"
    },
    {
      "color": "#e1e1e1",
      "spectrum": "#955ba5",
      "hue": "Grey",
      "percent": 0.05196428571428571,
      "css3": "#dcdcdc"
    },
    {
      "color": "#7d7d7d",
      "spectrum": "#8362aa",
      "hue": "Grey",
      "percent": 0.01744047619047619,
      "css3": "#808080"
    },
    {
      "color": "#969696",
      "spectrum": "#8761aa",
      "hue": "Grey",
      "percent": 0.014345238095238095,
      "css3": "#a9a9a9"
    },
    {
      "color": "#191919",
      "spectrum": "#1eb264",
      "hue": "Grey",
      "percent": 0.01005952380952381,
      "css3": "#000000"
    }
  ],
  "contextualtext": [
    {
      "date": null,
      "textiletext": null,
      "context": "Ancient Mediterranean and Near Eastern Bronzes at the Harvard Art Museums",
      "text": "This three-handled water jar, or hydria, is of the kalpis type, which has a continuous curving profile and originated c. 500 BCE, perhaps in Athens. The body was hammered out of a single sheet of bronze to which the cast portions—three handles, the foot, and the rim—were joined with solder. The surface of the vessel is largely a greenish gold, which is reminiscent of its original color, although there are extensive areas of a darker greenish gray. \r\n \r\nThe rim (15.7 cm in diameter) features an overhanging band of egg-and-dart molding. Each egg is surrounded by a single raised ridge. Tiny beads encircle the outside of the flattened rim. The foot (15.5 cm in diameter) displays a concave band of tongues, in between each of which is a narrower convex tongue. \r\n \r\nThe side handles, decorated with four concave flutes with rounded ends, rise from circular plates decorated with concave tongues. The vertical handle, circular in section, bears five flutes separated by narrow ridges divided by fine grooves. The top rises from a base plate situated beneath the rim, identical with the plates of the side handles. \r\n \r\nThe base plate is a siren, whose sickle-shaped wings rise up out of her torso and curve inward symmetrically on either side of her head. Each individual feather, rendered in relief, has a fine incised median line, on either side of which are tiny incisions. The siren’s body is also covered with finely incised scales, which have a median line flanked by tiny incisions. The siren’s feet, each bearing three claws, hang vertically from raised edges below the scales and grasp an oval object, from which a seven-petalled palmette, with concave leaves, projects downward. \r\n \r\nAbove the palmette are two antithetical, concave S-shaped volutes, the smaller ends of which curl under the siren’s wings. The spaces between the volutes, the wings, and the tendrils are left open. The volutes’ centers are filled with small hemispherical oculi, which may be silver (1). Two curls descend in relief, curving symmetrically over the shoulders of the siren. \r\n \r\nThis hydria belongs to a class of vessels with sirens adorning the base plate of the vertical handles (2). They begin c. 480 BCE and continue throughout the rest of the fifth century, perhaps even into the first quarter of the fourth century. The shape of the Harvard hydria suggests that it dates between 430 and 400 BCE. The only intact Greek bronze vessel in the Harvard Art Museums' collection, this vase was used to carry and pour water, as the name hydria implies. Its funerary significance may be inferred from the presence of the siren at the base of this handle. Such expensive metal vases were given as prizes in athletic contests and often later contained the cremated ashes of their owners. Such use probably explains the unusually fine state of preservation of this hydria. Harvard's hydria represents the highest quality of late Classical Greek metalwork.\r\n \r\nNOTES:\r\n \r\n1. For other examples of vessels with silver in the volutes, see E. D. Reeder, Scythian Gold: Treasures from Ancient Ukraine, exh. cat., The Walters Art Gallery (Baltimore, 1999) 193-94, no. 82; and J. M. Padgett, The Centaur’s Smile, exh. cat., Princeton University Art Museum (New Haven, 2003) no. 80.\r\n \r\n2. For comparison, see D. von Bothmer, “Bronze Hydriai,” Bulletin of the Metropolitan Museum of Art 13.6 (1955): 193-200, esp. 197; I. Kouleiman­ē-Vokotopoulou, Chalkai Korinthiourgeis prochoi: Symvolē eis tēn meletēn tēs archaias Hellēnikēs chalkourgias (Athens, 1975) [in Greek]; ead., “Ē hydria tēs Aineias,” in Amētos: Timētikos tomos gia ton kathēgētē Manolē Andronikos 2, eds. M. A. Tiverios, S. Drougou, and Ch. Saatsoglou-Paliadelē (Thessaloniki, 1987) 157-69, esp. pls. 24-26 [in Greek]; L. I. Marangou, Ancient Greek Art: The N. P. Goulandris Collection (Athens, 1985), 162-63; and M. True and K. Hamma, eds., A Passion for Antiquities: Ancient Art from the Collection of Barbara and Lawrence Fleischman, exh. cat., J. Paul Getty Museum, Malibu; Cleveland Museum of Art (Malibu, 1994) 68-70, no. 24.\r\n \r\n \r\nDavid G. Mitten",
      "type": "Published Catalogue Text"
    }
  ],
  "exhibitions": [
    {
      "begindate": null,
      "enddate": null,
      "citation": "<em>Dialogue with Antiquity: The Curatorial Achievement of George M.A. Hanfmann</em>, Fogg Art Museum, 05/07/1982 - 06/26/1982",
      "exhibitionid": 4145,
      "title": "Dialogue with Antiquity: The Curatorial Achievement of George M.A. Hanfmann"
    },
    {
      "begindate": "1967-12-04",
      "enddate": "1968-06-30",
      "citation": "<em>Master Bronzes from the Classical World</em>, Fogg Art Museum, Cambridge, 12/04/1967 - 01/23/1968; City Art Museum of St. Louis, St. Louis, 03/01/1968 - 04/13/1968; Los Angeles County Museum of Art, Los Angeles, 05/08/1968 - 06/30/1968",
      "exhibitionid": 558,
      "title": "Master Bronzes from the Classical World"
    },
    {
      "begindate": "1976-02-14",
      "enddate": "1976-04-14",
      "citation": "<em>Greek and Roman Metalware: A Loan Exhibition</em>, Walters Art Gallery, 02/14/1976 - 04/14/1976",
      "exhibitionid": 4902,
      "title": "Greek and Roman Metalware: A Loan Exhibition"
    },
    {
      "begindate": "2014-11-16",
      "enddate": "2050-01-01",
      "citation": "<em>32Q: 3400 Greek</em>, Harvard Art Museums, Cambridge, 11/16/2014 - 01/01/2050",
      "exhibitionid": 4470,
      "title": "32Q: 3400 Greek"
    }
  ],
  "gallery": {
    "begindate": "2014-11-16",
    "gallerynumber": "3400",
    "galleryid": 3400,
    "name": "Ancient Mediterranean and Near Eastern Art",
    "theme": "Ancient Greece in Black and Orange",
    "floor": 3
  },
  "groupings": [
    {
      "groupid": 2039923,
      "name": "Collection Highlights"
    },
    {
      "groupid": 2040129,
      "name": "Ancient Bronzes"
    },
    {
      "groupid": 2040174,
      "name": "Google Art Project"
    }
  ],
  "images": [
    {
      "date": "2013-05-28",
      "copyright": "President and Fellows of Harvard College",
      "imageid": 427747,
      "idsid": 46585832,
      "format": "image/jpeg",
      "description": null,
      "technique": null,
      "renditionnumber": "DDC251092",
      "displayorder": 1,
      "baseimageurl": "https://nrs.harvard.edu/urn-3:HUAM:DDC251092_dynmc",
      "alttext": null,
      "width": 1909,
      "publiccaption": null,
      "iiifbaseuri": "https://ids.lib.harvard.edu/ids/iiif/46585832",
      "height": 2550
    },
    {
      "date": "2014-06-05",
      "copyright": "President and Fellows of Harvard College",
      "imageid": 440789,
      "idsid": 400097623,
      "format": "image/jpeg",
      "description": null,
      "technique": null,
      "renditionnumber": "LEG252741",
      "displayorder": 2,
      "baseimageurl": "https://nrs.harvard.edu/urn-3:HUAM:LEG252741",
      "alttext": null,
      "width": 2351,
      "publiccaption": null,
      "iiifbaseuri": "https://ids.lib.harvard.edu/ids/iiif/400097623",
      "height": 2450
    },
    {
      "date": "2013-05-28",
      "copyright": "President and Fellows of Harvard College",
      "imageid": 427746,
      "idsid": 47334808,
      "format": "image/jpeg",
      "description": null,
      "technique": null,
      "renditionnumber": "DDC251030",
      "displayorder": 3,
      "baseimageurl": "https://nrs.harvard.edu/urn-3:HUAM:DDC251030_dynmc",
      "alttext": null,
      "width": 685,
      "publiccaption": null,
      "iiifbaseuri": "https://ids.lib.harvard.edu/ids/iiif/47334808",
      "height": 1024
    },
    {
      "date": "2008-02-19",
      "copyright": "President and Fellows of Harvard College",
      "imageid": 291689,
      "idsid": 8385158,
      "format": "image/jpeg",
      "description": null,
      "technique": null,
      "renditionnumber": "DDC105025",
      "displayorder": 4,
      "baseimageurl": "https://nrs.harvard.edu/urn-3:HUAM:DDC105025_dynmc",
      "alttext": null,
      "width": 827,
      "publiccaption": null,
      "iiifbaseuri": "https://ids.lib.harvard.edu/ids/iiif/8385158",
      "height": 1024
    },
    {
      "date": null,
      "copyright": "President and Fellows of Harvard College",
      "imageid": 14371,
      "idsid": 43182772,
      "format": "image/jpeg",
      "description": null,
      "technique": "Super XX",
      "renditionnumber": "46082",
      "displayorder": 5,
      "baseimageurl": "https://nrs.harvard.edu/urn-3:HUAM:46082_dynmc",
      "alttext": null,
      "width": 842,
      "publiccaption": null,
      "iiifbaseuri": "https://ids.lib.harvard.edu/ids/iiif/43182772",
      "height": 1024
    }
  ],
  "primaryimageurl": "https://nrs.harvard.edu/urn-3:HUAM:DDC251092_dynmc",
  "places": [
    {
      "displayname": "Ancient & Byzantine World, Europe, Chalke",
      "confidence": null,
      "placeid": 2037477,
      "type": "Creation Place"
    }
  ],
  "publications": [
    {
      "publicationplace": "London",
      "volumetitle": null,
      "citation": "<em>John Edward Taylor Collection of Works of Art</em>, auct. cat., Christie, Manson and Woods, Ltd. (London, 1912)",
      "publicationyear": 1912,
      "citationremarks": null,
      "pagenumbers": "p. 92, no. 367.",
      "format": "Auction/Dealer Catalogue",
      "publicationid": 20129,
      "title": "John Edward Taylor Collection of Works of Art",
      "volumenumber": null,
      "publicationdate": "1912"
    },
    {
      "publicationplace": "London",
      "volumetitle": null,
      "citation": "<em>Catalog of the collection of Egyptian and Roman antiquities, cameos and intaglios formed by the late Henry Oppenheimer</em>, auct. cat., William Clowes and Sons, Ltd. (London, 1936)",
      "publicationyear": 1936,
      "citationremarks": null,
      "pagenumbers": "p. 41, no. 126.",
      "format": "Auction/Dealer Catalogue",
      "publicationid": 20128,
      "title": "Catalog of the collection of Egyptian and Roman antiquities, cameos and intaglios formed by the late Henry Oppenheimer",
      "volumenumber": null,
      "publicationdate": "1936"
    },
    {
      "publicationplace": "New York, NY",
      "volumetitle": null,
      "citation": "<em>The Notable Art Collection Belonging to the estate of the late Joseph Brummer</em>, auct. cat., Parke-Bernet Galleries, Inc. (New York, NY, April 20 1940-April 23 1949)",
      "publicationyear": 1940,
      "citationremarks": null,
      "pagenumbers": "p. 45, no. 185.",
      "format": "Auction/Dealer Catalogue",
      "publicationid": 2387,
      "title": "The Notable Art Collection Belonging to the estate of the late Joseph Brummer",
      "volumenumber": null,
      "publicationdate": "April 20 1940-April 23 1949"
    },
    {
      "publicationplace": "Cambridge, MA",
      "volumetitle": null,
      "citation": "George M. A. Hanfmann, <em>Greek Art and Life, An Exhibition Catalogue</em>, exh. cat., Fogg Art Museum (Cambridge, MA, 1950)",
      "publicationyear": 1950,
      "citationremarks": null,
      "pagenumbers": "no. 15.",
      "format": "Exhibition Catalogue",
      "publicationid": 2769,
      "title": "Greek Art and Life, An Exhibition Catalogue",
      "volumenumber": null,
      "publicationdate": "1950"
    },
    {
      "publicationplace": "Mainz",
      "volumetitle": null,
      "citation": "Erika Zwierlein-Diehl, <em>Die Hydria: Formgeschichte und Verwendung im Kult des Altertums</em>, Verlag Philipp von Zabern (Mainz, 1964)",
      "publicationyear": 1964,
      "citationremarks": null,
      "pagenumbers": "p. 35ff, 219, no. B147.",
      "format": "Book",
      "publicationid": 20049,
      "title": "Die Hydria: Formgeschichte und Verwendung im Kult des Altertums",
      "volumenumber": null,
      "publicationdate": "1964"
    },
    {
      "publicationplace": "Mainz am Rhein, Germany",
      "volumetitle": null,
      "citation": "David Gordon Mitten and Suzannah F. Doeringer, <em>Master Bronzes from the Classical World</em>, exh. cat., Verlag Philipp von Zabern (Mainz am Rhein, Germany, 1967)",
      "publicationyear": 1967,
      "citationremarks": null,
      "pagenumbers": "p. 108, no. 108.",
      "format": "Exhibition Catalogue",
      "publicationid": 7820,
      "title": "Master Bronzes from the Classical World",
      "volumenumber": null,
      "publicationdate": "1967"
    },
    {
      "publicationplace": "Baltimore, MD",
      "volumetitle": null,
      "citation": "Walters Art Gallery, <em>Greek and Roman Metalware: A Loan Exhibition, February 14 - April 14, 1976</em>, exh. cat., Walters Art Gallery (Baltimore, MD, 1976)",
      "publicationyear": 1976,
      "citationremarks": null,
      "pagenumbers": "no. 18.",
      "format": "Exhibition Catalogue",
      "publicationid": 20127,
      "title": "Greek and Roman Metalware: A Loan Exhibition, February 14 - April 14, 1976",
      "volumenumber": null,
      "publicationdate": "1976"
    },
    {
      "publicationplace": "Cambridge, MA",
      "volumetitle": null,
      "citation": "David Gordon Mitten and Amy Brauer, <em>Dialogue with Antiquity, The Curatorial Achievement of George M. A. Hanfmann</em>, exh. cat., Fogg Art Museum (Cambridge, MA, 1982)",
      "publicationyear": 1982,
      "citationremarks": null,
      "pagenumbers": "p. 14, no. 39.",
      "format": "Exhibition Catalogue",
      "publicationid": 2422,
      "title": "Dialogue with Antiquity, The Curatorial Achievement of George M. A. Hanfmann",
      "volumenumber": null,
      "publicationdate": "1982"
    },
    {
      "publicationplace": "Cambridge and New York",
      "volumetitle": null,
      "citation": "Kristin A. Mortimer and William G. Klingelhofer, <em>Harvard University Art Museums: A Guide to the Collections</em>, Harvard University Art Museums and Abbeville Press (Cambridge and New York, 1986)",
      "publicationyear": 1986,
      "citationremarks": null,
      "pagenumbers": "p. 112, no. 125, ill.",
      "format": "Book",
      "publicationid": 9088,
      "title": "Harvard University Art Museums: A Guide to the Collections",
      "volumenumber": null,
      "publicationdate": "1986"
    },
    {
      "publicationplace": null,
      "volumetitle": null,
      "citation": "Amy Sowder, \"Greek Bronze Hydriai\" (2009), Emory University",
      "publicationyear": 2009,
      "citationremarks": null,
      "pagenumbers": "(Ph.D. diss.), p. 189, 543, no. 16.21.",
      "format": "Dissertation/Thesis",
      "publicationid": 20098,
      "title": "Greek Bronze Hydriai",
      "volumenumber": null,
      "publicationdate": "2009"
    },
    {
      "publicationplace": "Cambridge, MA",
      "volumetitle": "Ancient Bronzes through a Modern Lens: Introductory Essays on the Study of Ancient Mediterranean and Near Eastern Bronzes",
      "citation": "Susanne Ebbinghaus, \"Men of Bronze--Cups of Bronze: Bronze in the Iron Age\", <em>Ancient Bronzes through a Modern Lens: Introductory Essays on the Study of Ancient Mediterranean and Near Eastern Bronzes</em>, ed. Susanne Ebbinghaus, Harvard Art Museums (Cambridge, MA, 2014), 146-69",
      "publicationyear": 2014,
      "citationremarks": null,
      "pagenumbers": "pp. 164-65, fig. 7.10.",
      "format": "Article/Essay",
      "publicationid": 20753,
      "title": "\"Men of Bronze--Cups of Bronze: Bronze in the Iron Age\"",
      "volumenumber": "146-69",
      "publicationdate": "2014"
    },
    {
      "publicationplace": "Cambridge, MA",
      "volumetitle": null,
      "citation": "Susanne Ebbinghaus, ed., <em>Ancient Bronzes through a Modern Lens: Introductory Essays on the Study of Ancient Mediterranean and Near Eastern Bronzes</em>, Harvard Art Museum/Yale University Press (Cambridge, MA, 2014)",
      "publicationyear": 2014,
      "citationremarks": null,
      "pagenumbers": "pp. 54, 60, 66, 76, 164-165, fig. 7.10",
      "format": "Book",
      "publicationid": 22172,
      "title": "Ancient Bronzes through a Modern Lens: Introductory Essays on the Study of Ancient Mediterranean and Near Eastern Bronzes",
      "volumenumber": null,
      "publicationdate": "2014"
    }
  ],
  "details": {
    "technical": [
      {
        "text": "XRF data from Artax 1\r\nAlloy: Bronze\r\nAlloying Elements: copper, tin\r\nOther Elements: lead, iron, arsenic\r\nComments: Silvering and possible gilding were detected on the decorative elements.\r\n \r\nK. Eremin, January 2014",
        "formattedtext": "<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'\">XRF data from <SPAN style=\"mso-no-proof: yes\">Artax 1</SPAN><?xml:namespace prefix = \"o\" ns = \"urn:schemas-microsoft-com:office:office\" /><o:p></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'\">Alloy: <SPAN style=\"mso-no-proof: yes\">Bronze</SPAN><o:p></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'\">Alloying Elements: <SPAN style=\"mso-no-proof: yes\">copper, tin</SPAN><o:p></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'\">Other Elements: lead, <SPAN style=\"mso-no-proof: yes\">iron, arsenic<o:p></o:p></SPAN></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'; mso-no-proof: yes; mso-ascii-theme-font: major-bidi; mso-hansi-theme-font: major-bidi; mso-bidi-theme-font: major-bidi\">Comments: Silvering and possible gilding were detected on the decorative elements.<o:p></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-theme-font: major-bidi; mso-bidi-theme-font: major-bidi\"><o:p>&nbsp;</o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt; LINE-HEIGHT: normal\"><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-theme-font: major-bidi; mso-bidi-theme-font: major-bidi\"><o:p></o:p></SPAN><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-fareast-font-family: 'Times New Roman'; mso-no-proof: yes\">K. Eremin, January 2014</SPAN></P>",
        "type": "Chemical Composition"
      },
      {
        "text": "The raised portion of the vessel is mostly covered with green and underlying red corrosion products, some in the form of deep-seated warts. However, about one-fourth of the surface is extremely well preserved, with bright metal showing through a thin brown oxide layer, especially at the rim and mouth. The handle and foot castings are more deeply corroded, and small losses show that the mineralization passes completely through the casting in these areas. Brown burial accretions are present on both the vessel and the attached castings. \r\n \r\nThe surface is well preserved in many areas but deeply corroded in others, with two holes (c. 2 x 3 cm) in the middle of the sides of the vessel. These are filled with a modern resin, visible as a large red blob at the interior. The interior otherwise shows a uniform layer of green corrosion products without the warts visible on the exterior. Portions of the thinner periphery of the cast handles are lost and one loss (1 x 3 cm) in the volutes at the edge of the center handle is restored with a resin. The two side handles have been reattached with a threaded rod secured by nuts at the interior.\r\n \r\nHammer marks are visible at the interior, especially at the mouth, and a deep centering punch mark (2 mm in diameter) at the bottom indicates the vessel was formed using a raising process. The handles and foot are cast, with finer details added by cold working using punches and a tracer tool. The castings each correspond perfectly to faint incised lines pre-dating the surface corrosion, which strongly suggests that they do in fact belong to this vessel. In a few areas, there is a vague correspondence in the corrosion products on the casting and the vessel, which further reinforces the match. Some lead residue at two spots point to the use of lead as the original means of attaching the castings. A gap between the cast foot and the vessel at its bottom, now filled with a modern resin, is the only area imperfectly matched. This is understandable as part of the original fabrication in this less visible location. The volute (3 mm in diameter) centers on either side of the center handle decoration, and the entire chest of the siren shows a thin wash of a white metal. This was analyzed by XRF and determined to be silver. Mercury was detected, but at such a low level that a mercury-silver amalgam process is not clearly indicated.\r\n \r\n \r\nHenry Lie (submitted 2008)",
        "formattedtext": "<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><FONT size=3><FONT face=\"Times New Roman\">The raised portion of the vessel is mostly covered with green and underlying red corrosion products, some in the form of deep-seated warts. However, about one-fourth of the surface is extremely well preserved, with bright metal showing through a thin brown oxide layer, especially at the rim and mouth. The handle and foot castings are more deeply corroded, and small losses show that the mineralization passes completely through the casting in these areas. Brown burial accretions are present on both the vessel and the attached castings. <?xml:namespace prefix = \"o\" ns = \"urn:schemas-microsoft-com:office:office\" /><o:p></o:p></FONT></FONT></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><o:p><FONT size=3 face=\"Times New Roman\">&nbsp;</FONT></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><FONT size=3><FONT face=\"Times New Roman\">The surface is well preserved in many areas but deeply corroded in others, with two holes (c. 2 x 3 cm) in the middle of the sides of the vessel. These are filled with a modern resin, visible as a large red blob at the interior. The interior otherwise shows a uniform layer of green corrosion products without the warts visible on the exterior. Portions of the thinner periphery of the cast handles are lost and one loss (1 x 3 cm) in the volutes at the edge of the center handle is restored with a resin. The two side handles have been reattached with a threaded rod secured by nuts at the interior.<o:p></o:p></FONT></FONT></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><o:p><FONT size=3 face=\"Times New Roman\">&nbsp;</FONT></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><FONT size=3><FONT face=\"Times New Roman\">Hammer marks are visible at the interior, especially at the mouth, and a deep centering punch mark (2 mm in diameter) at the bottom indicates the vessel was formed using a raising process. The handles and foot are cast, with finer details added by cold working using punches and a tracer tool. The castings each correspond perfectly to faint incised lines pre-dating the surface corrosion, which strongly suggests that they do in fact belong to this vessel. In a few areas, there is a vague correspondence in the corrosion products on the casting and the vessel, which further reinforces the match. Some lead residue at two spots point to the use of lead as the original means of attaching the castings. A gap between the cast foot and the vessel at its bottom, now filled with a modern resin, is the only area imperfectly matched. This is understandable as part of the original fabrication in this less visible location. The volute (3 mm in diameter) centers on either side of the center handle decoration, and the entire chest of the siren shows a thin wash of a white metal. This was analyzed by XRF and determined to be silver. Mercury was detected, but at such a low level that a mercury-silver amalgam process is not clearly indicated.<o:p></o:p></FONT></FONT></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><o:p><FONT size=3 face=\"Times New Roman\">&nbsp;</FONT></o:p></SPAN></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 3pt\"><SPAN style=\"mso-ascii-font-family: 'Times New Roman'; mso-ascii-theme-font: major-bidi; mso-hansi-font-family: 'Times New Roman'; mso-hansi-theme-font: major-bidi; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: major-bidi\"><o:p><FONT size=3 face=\"Times New Roman\">&nbsp;</FONT></o:p></SPAN></P><SPAN style=\"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman','serif'; mso-ascii-theme-font: major-bidi; mso-hansi-theme-font: major-bidi; mso-bidi-theme-font: major-bidi; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-bidi-language: AR-SA; mso-ansi-language: EN-US; mso-fareast-language: EN-US\">Henry Lie (submitted 2008)</SPAN>",
        "type": "Technical Observations"
      }
    ]
  },
  "terms": {
    "medium": [
      {
        "name": "Metal",
        "id": 2028222
      },
      {
        "name": "bronze",
        "id": 2028223
      },
      {
        "name": "silver",
        "id": 2028401
      },
      {
        "name": "gold",
        "id": 2028692
      },
      {
        "name": "copper alloy",
        "id": 2040148
      }
    ],
    "place": [
      {
        "name": "Ancient & Byzantine World",
        "id": 2028220
      },
      {
        "name": "Europe",
        "id": 2028226
      },
      {
        "name": "Chalke",
        "id": 2037477
      }
    ],
    "century": [
      {
        "name": "5th century BCE",
        "id": 37525581
      }
    ],
    "culture": [
      {
        "name": "Greek",
        "id": 37527534
      }
    ],
    "topic": [
      {
        "name": "Artstor Digital Library",
        "id": 2040173
      },
      {
        "name": "Google Art Project",
        "id": 2040174
      }
    ]
  },
  "titles": [
    {
      "titletype": "Title",
      "titleid": 753004,
      "displayorder": 1,
      "title": "Hydria (water jar) with Siren Attachment"
    }
  ],
  "title": "Hydria (water jar) with Siren Attachment",
  "worktypes": [
    {
      "worktypeid": "401",
      "worktype": "vessel"
    }
  ],
  "seeAlso": [
    {
      "id": "https://iiif.harvardartmuseums.org/manifests/object/304069",
      "type": "IIIF Manifest",
      "format": "application/json",
      "profile": "http://iiif.io/api/presentation/2/context.json"
    }
  ]
}
```

### Authentication Requirements
The only authentication that will be required to retrieve the data will be the API key. A request to obtain your API key could be sent from:
https://docs.google.com/forms/d/e/1FAIpQLSfkmEBqH76HLMMiCC-GPPnhcvHC9aJS86E32dOd0Z8MpY2rvQ/viewform


### Optional Additional Documentation (such as using a pre-built client)
I do not plan on using any official python client module.

### Description of what I plan to do with the data
I wanted to retrieve all the images in the museum with an object id of "304069" and a width less than a 1000. 