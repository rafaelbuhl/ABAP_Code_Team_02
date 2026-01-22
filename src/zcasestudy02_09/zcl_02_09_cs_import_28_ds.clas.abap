CLASS zcl_02_09_cs_import_28_ds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_28_ds IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*ABC Automobile Andreas Klecha Bramfelder Chaussee 261 Hamburg 22177 0406410563
*ALGA Transportmittel-Vermietung und Autohandel GmbH Andreas-Meyer-Str. 17a Hamburg 22113 040784824
*AUDI Autohaus Wichert GmbH Stockflethweg 30 Hamburg 22417 0405270371
*AUTO-DIREKT AutomobilHdl. Kieler -336 Kieler Str. 336 Hamburg 22525 0405449545
*Adomeit Herbert Borner Stieg 43 Hamburg 22417 0405202829
*Ahlfeld Werner (GmbH & Co.) Friedrich-Ebert-Allee 4 Schenefeld, Bz Hamburg 22869 0408304066
*Ariana Automobile Fried Fedai Hammer Str. 62 Hamburg 22043 0406521006
*Ariana Automobile Fried Fedai Hammer Str. 62 Hamburg 22043 info@arianaautomobile.de
*Ariana Automobile Fried Fedai Hammer Str. 62 Hamburg 22043 0406526613
*Autohaus Albert J. Knaak GmbH Siegfriedstr. 8 Norderstedt 22851 0405293597
*Autohaus Bargteheide GmbH Hamburger Str. 32 Bargteheide 22941 045326584
*Autohaus Barmbek GmbH Stieglitzstr. 9 Hamburg 22081 040291156
*Autohaus Bergstedt, U. Müller GmbH Bergstedter Chaussee 214 Hamburg 22395 0406040039
*Autohaus Bergstedt,U. Müller GmbH Bergstedter Chaussee 214 Hamburg 22395 0406049844
*Autohaus Biesterfeldt & Schmidt GmbH & Co.KG Kronskamp 125 Wedel 22880 041039169-0
*Autohaus Elbgemeinden Inh. Jürgen Callesen Osterbrooksweg 89 Schenefeld, Bz Hamburg 22869 0408391138
*Autohaus Elbgemeinden Inh. Jürgen Callesen Osterbrooksweg 89 Schenefeld, Bz Hamburg 22869 0408301435
*Autohaus Elbgemeinden, Inh. Hans-Jürgen Callesen Osterbrooksweg 89 Schenefeld, Bz Hamburg 22869 040839398-0
*Autohaus F.Kemnitz GmbH Lübecker Str. 25 Bargteheide 22941 045327014
*Autohaus Fricke FORD-Vertretung Kronskamp 115 Wedel 22880 0410383033
*Autohaus Gabor GmbH Poppenbütteler Weg 5 Hamburg 22339 040538009-14
*Autohaus Gerd Koch GmbH Bei der Neuen Münze 5 Hamburg 22145 0406792146
*Autohaus Gomme GmbH Horner Landstr. 380 Hamburg 22111 0407324427
*Autohaus Günther GmbH Poppenbütteler Bogen 33 Hamburg 22399 0406064112
*Autohaus Günther GmbH Poppenbütteler Bogen 33 Hamburg 22399 0406024005
*Autohaus Hagemann GmbH Manshardtstr. 74 Hamburg 22119 0406513208
*Autohaus Hagemann GmbH Manshardtstr. 74 Hamburg 22119 0406513604
*Autohaus Hammoor GmbH Hauptstr. 47 Hammoor b Ahrensburg 22929 045328216
*Autohaus Hermann Kröger Langenhorner Chaussee 93 Hamburg 22415 0408304091
*Autohaus Homburg Inh. Gerhard Homburg Hammoorer Weg 34 Bargteheide 22941 045327482
*Autohaus Jenfeld Öjendorfer Damm 97a Hamburg 22043 0406531490
*Autohaus Kausch und Scheel oHG Hans-Böckler-Ring 1 Norderstedt 22851 0405248556
*Autohaus Klein GmbH Barmbeker Str. 26 Hamburg 22303 info@autohausklein.de
*Autohaus Klein GmbH Barmbeker Str. 26 Hamburg 22303 0402703664
*Autohaus Klein GmbH Barmbeker Str. 28 Hamburg 22303 040271201
*Autohaus Kollinger GmbH Billbrookdeich 335 Hamburg 22113 040731602
*Autohaus Kollinger GmbH Billbrookdeich 335 Hamburg 22113 0407329342
*Autohaus Königstraße GmbH Königstr. 28 Hamburg 22767 040389966-01
*Autohaus Langenhorn Bopp, Dewath & Gatz GmbH Oehleckerring 9 Hamburg 22419 0405317521
*Autohaus Luth & Partner GmbH Tonndorfer Hauptstr. 110 Hamburg 22045 040662242
*Autohaus Luth & Partner GmbH Tonndorfer Hauptstr. 110 Hamburg 22045 0406725056
*Autohaus Luth & Partner GmbH Tonndorfer Hauptstr. 110 Hamburg 22045 in?fo@autohausluth.de
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 0406451001
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 0406451001
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 0406451002
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 0406451003
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 0406451949
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 info@autohausklein.de
*Autohaus Lüßenhoff GmbH An der Walddörferbahn 7 Hamburg 22159 noreply@autohausklein.de
*Autohaus Michael GmbH Holstenhofweg 42 Hamburg 22043 040656900-0
*Autohaus Michael TOYTA LEXLIS Holstenhofweg 42 Hamburg 22043 040656900-0
*Autohaus Möller und Goede GmbH Kuehnstr. 89 Hamburg 22045 040660799
*Autohaus Mühlenkamp GmbH Mühlenkamp 65 Hamburg 22303 0402797871
*Autohaus Nissen FORD-Vertragswerkstatt Hamburger Str. 58 Trittau 22946 041547196
*Autohaus Osdorf GmbH Osdorfer Landstr. 186 Hamburg 22549 0408007020
*Autohaus Osdorf GmbH Osdorfer Landstr. 186 Hamburg 22549 040806883
*Autohaus Prahl Mitsubishi-Vertr.-Hdl. Dorfstr. 53 Schönberg, Kr Hzgt Lauenb 22929 045347009
*Autohaus Puttkammer GmbH Mörkenstr. 3 Hamburg 22767 040381991
*Autohaus Rahlstedt GmbH Bargteheider Str. 24 Hamburg 22143 0406776011
*Autohaus Renzing GmbH Luruper Hauptstr. 82 Hamburg 22547 0408314075
*Autohaus Riegel GmbH Vorburgstr. 15 Trittau 22946 041542257
*Autohaus Rosenbaum GmbH Tinsdaler Weg 142b Wedel 22880 0410317999
*Autohaus Roßbach GmbH Thomas-Mann-Str. 33 Hamburg 22175 0406401091
*Autohaus Russmeyer Großenseer Str. 7 Trittau 22946 0415480800
*Autohaus Selmsdorf KFZ GmbH Liebigstr. 22 Hamburg 22113 0407320817
*Autohaus Udo von Ahnen GmbH Saseler Chaussee 34 Hamburg 22391 040640877-0
*Autohaus Uhlenhorst GmbH Nedderfeld 89 Hamburg 22529 0404662-0
*Autohaus W.Wülfing & Sohn oHG Nebendahlstr. 11 Hamburg 22041 0406525001
*Autohaus Walddörfer Dewath & Gatz GmbH Bergstedter Chaussee 175 Hamburg 22395 0406045763
*Autohaus Wandsbek GmbH Jenfelder Allee 70 Hamburg 22043 0406533658
*Autohaus Weber GmbH SUZUKI - Vertragshändler Rausdorfer Str. 39 Trittau 22946 041542527
*Autohaus Weber in Eidelstedt Günter Weber Holsteiner Chaussee 91 Hamburg 22523 0405702896
*Autohaus Weber in Eidelstedt Günter Weber Holsteiner Chaussee 91 Hamburg 22523 040570004-0
*Autohaus Wehner GmbH Volksparkstr. 42 Hamburg 22525 0405405053
*Autohaus Weise GmbH Tinsdaler Weg 142 Wedel 22880 info@autohausweise.de
*Autohaus Weise GmbH Tinsdaler Weg 142 Wedel 22880 0410316693
*Autohaus Weise GmbH Tinsdaler Weg 142 Wedel 22880 041035038
*Autohaus Wichert GmbH Stockflethweg 30 Hamburg 22417 0405270371
*Autohaus Wichert GmbH Stockflethweg 30 Hamburg 22417 0405274830
*Autohaus im Offakamp Klaus-Uwe Grebe KG Offakamp 31 Hamburg 22529 0405535016
*Automobile J. & R. Rosenberg GmbH Sülldorfer Landstr. 232 Hamburg 22589 0408706066
*Automobile S. Prehm spez. Porsche u. Mercedes-Benz Inh. Sab Alsterdorfer Str. 254 Hamburg 22297 0405114868
*BARMBEKER AUTOHAUS Stieglitzstr. 9-11 Hamburg 22081 040291156
*BECKER AUTOMOBILE GMBH Kuehnstr. 91 Hamburg 22045 040660906
*BMW AG Niederlassung Hamburg Wellingsbütteler Landstr. 20 Hamburg 22337 04050717-139
*Beckmann Peter Autohaus Vorburgstr. 21 Trittau 22946 041548070-0
*Behrmann GmbH & Co. KG Automobile, Gebrüder Segeberger Chaussee 55 Norderstedt 22850 0405293013
*Biehl Rolf Holsteiner Chaussee 175 Hamburg 22457 0405503250
*Bobert Otto Ellerbrookswisch 30 Hamburg 22397 0406055469
*Bunge Arthur (GmbH & Co.) Opel Händler Eidelstedter Platz 30 Hamburg 22523 040570001-0
*Bönigk Heinz Fabriciusstr. 46 Hamburg 22177 0406914675
*Böttcher Udo Sport-Tourenwagen Service Autohaus Hyundai Kieler Str. 207 Hamburg 22525 040858089
*Bücker Uwe Max-Brauer-Allee 209 Hamburg 22765 0404394235
*Catena Automobile GmbH Kurt-Fischer-Str. 33 Ahrensburg 22926 041022207-0
*Catena Automobile GmbH Schenefelder Landstr. 174a Hamburg 22589 040870700-30
*Christiansen Thomas Grönwohld, Kr Stormarn 22956 041545030
*Christiansen Thomas Grönwohld, Kr Stormarn 22956 041545029
*D & K Automobile GmbH Segeberger Chaussee 142 Norderstedt 22851 0405244729
*DAEWOO Auto-Center GmbH Bargteheider Str. 14 Hamburg 22143 0406770505
*Deventer Kieler Str. 286 Hamburg 22525 040545340
*EG-NEUWAGEN DISCOUNT Quickborner Str. 146 Norderstedt 22844 0405221025
*Eick E. Ottensener Str. 125 Hamburg 22525 0405404804
*Ernst Franz Pezolddamm 152 Hamburg 22159 040640870-0
*FIAT Autohaus Lohe GmbH Lohe 3 Ahrensburg 22926 0410254290
*FORD-Vertretung Autohaus Fricke Kronskamp 115 Wedel 22880 0410383033
*Fiat Automobil AG Niederlassung Hamburg Nedderfeld 30 Hamburg 22529 040553003-60
*Fiat Automobil AG Zweigniederlassung Hamburg Nedderfeld 30 Hamburg 22529 040553003-0
*Ford Autohaus Rahlstedt GmbH Bargteheider Str. 26 Hamburg 22143 0406776011
*Fricke Christian Poppenbütteler Chaussee 35 Hamburg 22397 0406072576
*Gabor GmbH Poppenbütteler Weg 5 Hamburg 22339 040538009-0
*Geertz Peter Alter Teichweg 59 Hamburg 22049 0406900525
*Gregor Ralf Redder 44 Hamburg 22393 0407158901
*Gräper Peter Walddörferstr. 294c Hamburg 22047 0406937300
*H.M. Ueckerstr. 33 Hamburg 22547 0408322555
*H.M.V. Automobile Inh. H. Kupfernagel Tiedemannstr. 18 Hamburg 22525 0408506665
*HADA-Automobile Gebrauchtwagenhandel OHG Werner-Siemens-Str. 111 Hamburg 22113 0407325544
*Hansen Heiner Tangstedter Weg 73 Norderstedt 22851 0405291757
*Hansen Herbert Höhenkamp 3 Braak b Hamburg 22145 0406778964
*Henke Gerd-Joachim Kronskamp 98 Wedel 22880 041033904
*Heyn Peter Vörn Barkholt 13 Hamburg 22359 0406032722
*Hofer Michael Friedrich-Ebert-Damm 180 Hamburg 22047 0406697530
*Hopp Hanns-Jörg Leverkusenstr. 25 Hamburg 22761 040859121
*Höfs Peter In de Tarpen 106 Norderstedt 22848 0405236246
*J.K. Bei der Alten Kate 6 Ahrensburg 22926 041021570
*JEEP Osdorfer Landstr. 238 Hamburg 22549 040807888-0
*Jeep Autohaus Thomas Luth Rahlstedter Str. 1-3 Hamburg 22149 040673960-0
*Junge Automobile GmbH Kieler Str. 310 Hamburg 22525 040545444
*Junge Automobile GmbH Kieler Str. 310 Hamburg 22525 040546061
*KEITEL Autohaus Niendorf GmbH Adlerhorst 11 Hamburg 22459 0405516868
*Kallus Andreas Walddörferstr. 324 Hamburg 22047 0406935043
*Kellerhoff Marlis Eppendorfer Stieg 10 Hamburg 22299 040489463
*Kern Karl-heinz Raawisch 18 Hamburg 22043 04065493191
*Kiekebusch Automobile & Reifen Ochsenzoller Str. 120 Norderstedt 22848 0405235067
*Kipke Max Heestweg 19 Hamburg 22143 0406779079
*Klecha Andreas Bramfelder Chaussee 261 Hamburg 22177 0406414087
*Klecha Andreas Bramfelder Chaussee 261 Hamburg 22177 0406417042
*Kleingarn Ralf Sandfoort 55 Hamburg 22415 0405322554
*Krall Arnold Fuhlsbüttler Str. 21 Hamburg 22305 0402986436
*Köse Ozkan Ohechaussee 192 Norderstedt 22848 0405285448
*Künzel Autohaus Steilshoop GmbH Steilshooper Str. 319 Hamburg 22309 0406303073
*Künzel Autohaus Steilshoop GmbH Steilshooper Str. 319 Hamburg 22309 0406303076
*Künzel Autohaus Steilshoop GmbH Steilshooper Str. 319 Hamburg 22309 info@autohauskuenzel.de
*LADA Autohaus Königstraße GmbH LADA Vertragshändler Autohau Königstr. 28 Hamburg 22767 040389966-01
*Lauße Albertg & Sohn (GmbH & Co) August-Krogmann-Str. 200 Hamburg 22159 0406430051
*Leberfinger Lutz Kiebitzhörn 31 Barsbüttel 22885 0406703020
*Lembke Oliver Luruper Hauptstr. 243c Hamburg 22547 040836281
*Leseberg Automobile GmbH Osdorfer Landstr. 211 Hamburg 22549 040800904-0
*Lindow Jürgen Maurienstr. 19a Hamburg 22305 040290884
*Lunau Automobile GmbH Opel u. Suzuki Schellingstr. 42 Hamburg 22089 0402000040
*Luth Thomas Rahlstedter Str. 1-3 Hamburg 22149 040673960-0
*MITSUBISHI AUTOHAUS SEEVETAL KG Wildes Moor 2 Hamburg 22339 0407686833
*MITSUBISHI Autohaus Möller & Goede Kuehnstr. 89 Hamburg 22045 040660799
*Mascher Automobile GmbH Walddörferstr. 340 Hamburg 22047 0406937266
*Mascher Automobile GmbH Walddörferstr. 340 Hamburg 22047 0406933009
*Mazda AUTOHAUS ZINGELMANN GMBH Kurt-Fischer-Str. 24 Ahrensburg 22926 041022228-0
*Mindemann Wandsbeker Chaussee 91 Hamburg 22089 0402005558
*Mitsubishi Autohaus Bornemann GmbH Harksheider Str. 45 Hamburg 22399 0406063131
*Mitsubishi Autohaus im Offakamp Mitsubishi Vertragshändler Nedderfeld Hamburg 22529 0405535016
*Mitsubishi-Motors Tinsdaler Weg 140 Wedel 22880 041035038
*NFA Nutzfahrzeuge + Freizeit-Automobile GmbH Volksdorfer Weg 13 Hamburg 22391 0406001850
*NFA Nutzfahrzeuge + Freizeit-Automobile GmbH Volksdorfer Weg 182 Hamburg 22393 040600185-20
*NFA Nutzfahrzeuge + Freizeit-Automobile GmbH Volksdorfer Weg 182 Hamburg 22393 info@nfanutzfahrzeuge.de
*NFA Nutzfahrzeuge + Freizeit-Automobile GmbH Volksdorfer Weg 182 Hamburg 22393 noreply@nfanutzfahrzeuge.de
*Offer Klaus-Peter Bramfelder Str. 105 Hamburg 22305 040611047
*Offer Klaus-Peter Bramfelder Str. 105 Hamburg 22305 040614128
*Opel Arthur Bunge OPEL AUTOHAUS BUNGE Eidelstedter Platz 26 Hamburg 22523 0405700010
*Opel Händler Vermiet GmbH Ulzburger Str. 405 Norderstedt 22846 04053593-0
*Opel Voss Opel-Vertragshändler Langenhorner Chaussee 1 Hamburg 22335 0405332290
*Orient Autohandel EI Sayed GmbH Brockhausweg 19 Hamburg 22117 0407132403
*Orient Autohandel El Sayed GmbH Brockhausweg 19 Hamburg 22117 040782742
*Palekcic Ivan Maimoorweg 38 Hamburg 22179 0406412811
*Partner Autohaus Luth GmbH Tonndorfer Hauptstr. 110 Hamburg 22045 0406682627
*Plechinger Günther Ruhrstr. 158 Hamburg 22761 0408511525
*Prahl Heinz-Günter Dorfstr. 53 Schönberg, Kr Hzgt Lauenb 22929 045347009
*Pries Joachim Wöhrendamm 35 Großhansdorf 22927 0410264992
*Pries Joachim Wöhrendamm 35 Großhansdorf 22927 0410265335
*RC Autohandel Niendorfer Str. 52 Hamburg 22529 040585283
*RENAULT Autohaus Debler Behringstr. 128 Hamburg 22763 040889190-0
*Reber Helmut Holstenstr. 157 Hamburg 22765 0404398589
*Reher Heinz Berner Heerweg 134 Hamburg 22159 0406431670
*Reich Oskar Peter-Timm-Str. 9 Hamburg 22457 0405508473
*Reiche Robert Hamburger Str. 11 Ammersbek 22949 0406050225
*Reimers Automobile Mazda, Holsteiner Chaussee 171 Hamburg 22457 0405592094
*Renault Behringstr. 128 Hamburg 22763 040889190-0
*Renault Auto in Stellingen Junge Automobile GmbH Kieler Str. 310 Hamburg 22525 040546061
*Renault ab City Hamburg Bilia Automobile GmbH Ivo-Hauptmann-Ring Hamburg 22159 040645950
*Rothe Dieter Lademannbogen 13 Hamburg 22339 0405385175
*Russmeyer GmbH Autohaus Trittau Großenseer Str. 7 Trittau 22946 041548080-50
*Russmeyer GmbH, Autohaus Trittau Großenseer Str. 7 Trittau 22946 041548080-0
*Röhl M. Billwerder Billdeich 48 Hamburg 22113 0407321454
*Röpcke-Automobile GmbH Auf dem Königslande 23 Hamburg 22041 0406526163
*Röpcke-Automobile GmbH Auf dem Königslande 23 Hamburg 22041 040683368
*S.E.C. Automobile GmbH Pinneberger Str. 6 Hamburg 22457 0405595992
*S.E.C. Automobile GmbH Pinneberger Str. 6 Hamburg 22457 0405592228
*SEAT Autohaus Scheel Hans-Böckler-Ring 1 Norderstedt 22851 0405248556
*SEAT IN WEDEL HENKE AUTOMOBILE Krohnskamp 98 Hamburg 22301 041033904
*SEAT in Horn/Billstedt Autohaus Hagemann GmbH Manshardtstr. 74 Hamburg 22119 0406513604
*SEAT-Autohaus Oettinger & Partner GmbH Ewige Weide 12 Ahrensburg 22926 0410245091
*SEAT-Vertragshändler Henke Automobile Kronskamp 98 Wedel 22880 041033904
*SKN-Autohandel Max-Brauer-Allee 247 Hamburg 22769 04043250100
*SM Eidelstedter Autohandel GmbH Kieler Str. 570 Hamburg 22525 0405405597
*SSANGYONG Autohaus Königstraße GmbH Königstr. 28 Hamburg 22767 040389966-01
*Saab Autohaus Dello Saab Zentrum hamburg ... KENNER WISSEN Nedderfeld 89 Hamburg 22529 0404662-2410
*Sander & Co. Drosselstr. 2 Hamburg 22305 040618171
*Sandhof Frank Usedomstr. 14 Hamburg 22047 0406682877
*Schelletter Horst Hamburger Str. 1 Delingsdorf 22929 045326532
*Schlangen K.-D. GmbH Osdorfer Landstr. 238 Hamburg 22549 040807888-0
*Schlüter Wolfgang Köppenstr. 16c Hamburg 22453 0405141080
*Schnehagen Franz Thadenstr. 162 Hamburg 22767 0404390093
*Schnoor Ute Am Neumarkt 29 Hamburg 22041 0406567400
*Scholtz Wolfgang Bahrenfelder Str. 27 Hamburg 22765 0403901728
*Schönbach Jürgen Waldweg 59 Hamburg 22393 0406014241
*Siems Ulrich W. Oehleckerring 9 Hamburg 22419 0405312419
*Strohband Wolfgang Hamburger Str. 166 Hamburg 22083 040294957
*Struckmeyer Horst Bachstr. 5 Barsbüttel 22885 0407112595
*Suzuki Zingelmann Autohaus GmbH Kurt-Fischer-Str. 24 Ahrensburg 22926 041022228-0
*TOYOTA Vertragshändler Autohaus Rosenbaum GmbH Tinsdaler Weg 142b Wedel 22880 0410317999
*Thielert Frank Holsteinischer Kamp 104 Hamburg 22081 0402996568
*Thielert Frank Holsteinischer Kamp 104 Hamburg 22081 040291584
*Thiesen Peter Lohkampstr. 18 Hamburg 22523 040578355
*Thode & Sohn GmbH Sülldorfer Landstr. 108 Hamburg 22589 040872041
*Toyota VertragsHdl. Holstenhofweg 42 Hamburg 22043 040656900-0
*Trend Automobile Handelsges. mbH Langenhorner Chaussee 109 Hamburg 22415 0405314007
*Triumphal Automobile GmbH Borselstr. 9 Hamburg 22765 040394579
*Unruh Fahrenkrön 119 Hamburg 22179 0406430071
*VW-NFA Nutzfahrzeuge + Freizeit-Automobile GmbH Volksdorfer Weg 182 Hamburg 22393 0406001850
*Vidal + Sohn (GmbH & Co.) Bornkampsweg 137 Hamburg 22761 04089954-0
*Volvo Kille Automobile GmbH Möllner Landstr. 41 Hamburg 22111 0407103011
*Volvo ab City Hamburg Catena Automobile GmbH Osdorfer Landstr. 403 Hamburg 22589 040
*WHD-Automobile Saseler Chaussee 9 Hamburg 22391 0405366592
*Weik J. Hildeboldtweg 19a Hamburg 22179 0406412929
*Wex C. Ebertallee 8 Hamburg 22607 0408997729
*Winkler Automobile/Export GmbH, Frank Stockkamp 15 Hamburg 22607 01713151188
*Witt Werner Hamburger Str. 207 Hamburg 22083 0402992724
*Wulff Karsten Friedensallee 94 Hamburg 22763 0403906025
*Wunner H. Schmarjestr. 42 Hamburg 22767 040387605
*Wüpper Klaus Holsteinischer Kamp 82 Hamburg 22081 0402993151
*Zamzam Amer Mohammed Thiedeweg 29 Hamburg 22047 0406952440
*Zenke GmbH Am Born 25 Hamburg 22765 040391523
*Zingelmann-Autohaus GmbH Kurt-Fischer-Str. 26 Ahrensburg 22926 041022228-0
*bilia Automobile GmbH Friedrich-Ebert-Damm 319 Hamburg 22159 04064595-0



  ENDMETHOD.
ENDCLASS.
