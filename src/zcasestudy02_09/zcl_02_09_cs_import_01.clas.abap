CLASS zcl_02_09_cs_import_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      " Quelltext speichert die Daten unformattiert in der Tabelle ZTL_02_09_CS
    DATA ls_customer TYPE ztl_02_09_cs.
    ls_customer-import  = |"ABC Automobile Andreas Klecha";"Bramfelder Chaussee 261";"22177";"Hamburg";"";"040";"6410563"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Adomeit Herbert";"Borner Stieg 43";"22417";"Hamburg";"";"040";"5202829"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"ALGA Transportmittel-Vermietung und Autohandel GmbH";"Andreas-Meyer-Str. 17a";"22113";"Hamburg";"";"040";"784824"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Ariana Automobile Fried Fedai";"Hammer Str. 62";"22043";"Hamburg";"Telefax";"040";"6521006"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Ariana Automobile Fried Fedai";"Hammer Str. 62";"22043";"Hamburg";"Email";"info@arianaautomobile.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Ariana Automobile Fried Fedai";"Hammer Str. 62";"22043";"Hamburg";"";"040";"6526613"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"AUDI Autohaus Wichert GmbH";"Stockflethweg 30";"22417";"Hamburg";"";"040";"5270371"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"AUTO-DIREKT AutomobilHdl. Kieler -336";"Kieler Str. 336";"22525";"Hamburg";"";"040";"5449545"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Barmbek GmbH";"Stieglitzstr. 9";"22081";"Hamburg";"";"040";"291156"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Bergstedt, U. Müller GmbH";"Bergstedter Chaussee 214";"22395";"Hamburg";"Telefax";"040";"6040039"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Bergstedt,U. Müller GmbH";"Bergstedter Chaussee 214";"22395";"Hamburg";"";"040";"6049844"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Gabor GmbH";"Poppenbütteler Weg 5";"22339";"Hamburg";"Telefax";"040";"538009-14"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Gerd Koch GmbH";"Bei der Neuen Münze 5";"22145";"Hamburg";"";"040";"6792146"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Gomme GmbH";"Horner Landstr. 380";"22111";"Hamburg";"Telefax";"040";"7324427"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Günther GmbH";"Poppenbütteler Bogen 33";"22399";"Hamburg";"";"040";"6024005"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Günther GmbH";"Poppenbütteler Bogen 33";"22399";"Hamburg";"Telefax";"040";"6064112"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Hagemann GmbH";"Manshardtstr. 74";"22119";"Hamburg";"";"040";"6513604"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Hagemann GmbH";"Manshardtstr. 74";"22119";"Hamburg";"Telefax";"040";"6513208"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Hermann Kröger";"Langenhorner Chaussee 93";"22415";"Hamburg";"";"040";"8304091""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus im Offakamp Klaus-Uwe Grebe KG";"Offakamp 31";"22529";"Hamburg";"";"040";"5535016"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Jenfeld";"Öjendorfer Damm 97a";"22043";"Hamburg";"";"040";"6531490"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Klein GmbH";"Barmbeker Str. 28";"22303";"Hamburg";"";"040";"271201"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Klein GmbH";"Barmbeker Str. 26";"22303";"Hamburg";"Telefax";"040";"2703664"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Klein GmbH";"Barmbeker Str. 26";"22303";"Hamburg";"Email";"info@autohausklein.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Königstraße GmbH";"Königstr. 28";"22767";"Hamburg";"";"040";"389966-01"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Kollinger GmbH";"Billbrookdeich 335";"22113";"Hamburg";"";"040";"7329342"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Kollinger GmbH";"Billbrookdeich 335";"22113";"Hamburg";"";"040";"731602"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Langenhorn Bopp, Dewath & Gatz GmbH";"Oehleckerring 9";"22419";"Hamburg";"Telefax";"040";"5317521"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"";"040";"6451001"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"";"040";"6451001"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"";"040";"6451002"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"";"040";"6451003"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"Telefax";"040";"6451949"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"Email";"info@autohausklein.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Autohaus Lüßenhoff GmbH";"An der Walddörferbahn 7";"22159";"Hamburg";"Email";"noreply@autohausklein.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.




    ls_customer-import  = |"Autohaus Luth & Partner GmbH";"Tonndorfer Hauptstr. 110";"22045";"Hamburg";"Telefax";"040";"662242"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Luth & Partner GmbH";"Tonndorfer Hauptstr. 110";"22045";"Hamburg";"";"040";"6725056"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Luth & Partner GmbH";"Tonndorfer Hauptstr. 110";"22045";"Hamburg";"Email";"in?fo@autohausluth.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Michael GmbH";"Holstenhofweg 42";"22043";"Hamburg";"";"040";"656900-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Michael TOYTA LEXLIS";"Holstenhofweg 42";"22043";"Hamburg";"";"040";"656900-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Möller und Goede GmbH";"Kuehnstr. 89";"22045";"Hamburg";"";"040";"660799"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Mühlenkamp GmbH";"Mühlenkamp 65";"22303";"Hamburg";"";"040";"2797871"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Osdorf GmbH";"Osdorfer Landstr. 186";"22549";"Hamburg";"";"040";"806883"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Osdorf GmbH";"Osdorfer Landstr. 186";"22549";"Hamburg";"Telefax";"040";"8007020"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Puttkammer GmbH";"Mörkenstr. 3";"22767";"Hamburg";"";"040";"381991"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Rahlstedt GmbH";"Bargteheider Str. 24";"22143";"Hamburg";"";"040";"6776011"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Renzing GmbH";"Luruper Hauptstr. 82";"22547";"Hamburg";"";"040";"8314075"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Roßbach GmbH";"Thomas-Mann-Str. 33";"22175";"Hamburg";"";"040";"6401091"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Selmsdorf KFZ GmbH";"Liebigstr. 22";"22113";"Hamburg";"";"040";"7320817"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Udo von Ahnen GmbH";"Saseler Chaussee 34";"22391";"Hamburg";"";"040";"640877-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Uhlenhorst GmbH";"Nedderfeld 89";"22529";"Hamburg";"";"040";"4662-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus W.Wülfing & Sohn oHG";"Nebendahlstr. 11";"22041";"Hamburg";"";"040";"6525001"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Walddörfer Dewath & Gatz GmbH";"Bergstedter Chaussee 175";"22395";"Hamburg";"";"040";"6045763"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Wandsbek GmbH";"Jenfelder Allee 70";"22043";"Hamburg";"Telefax";"040";"6533658"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Weber in Eidelstedt Günter Weber";"Holsteiner Chaussee 91";"22523";"Hamburg";"Telefax";"040";"5702896"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Weber in Eidelstedt Günter Weber";"Holsteiner Chaussee 91";"22523";"Hamburg";"";"040";"570004-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Wehner GmbH";"Volksparkstr. 42";"22525";"Hamburg";"";"040";"5405053"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Wichert GmbH";"Stockflethweg 30";"22417";"Hamburg";"";"040";"5270371"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Wichert GmbH";"Stockflethweg 30";"22417";"Hamburg";"Telefax";"040";"5274830"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Automobile J. & R. Rosenberg GmbH";"Sülldorfer Landstr. 232";"22589";"Hamburg";"";"040";"8706066"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Automobile S. Prehm spez. Porsche u. Mercedes-Benz Inh. Sabine Prehm";"Alsterdorfer Str. 254";"22297";"Hamburg";"";"040";"5114868"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"BARMBEKER AUTOHAUS";"Stieglitzstr. 9-11";"22081";"Hamburg";"";"040";"291156"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"BECKER AUTOMOBILE  GMBH";"Kuehnstr. 91";"22045";"Hamburg";"";"040";"660906"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Biehl Rolf";"Holsteiner Chaussee 175";"22457";"Hamburg";"Telefax";"040";"5503250"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"bilia Automobile GmbH";"Friedrich-Ebert-Damm 319";"22159";"Hamburg";"";"040";"64595-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"BMW AG Niederlassung Hamburg";"Wellingsbütteler Landstr. 20";"22337";"Hamburg";"Telefax";"040";"50717-139"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Bobert Otto";"Ellerbrookswisch 30";"22397";"Hamburg";"";"040";"6055469"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Bönigk Heinz";"Fabriciusstr. 46";"22177";"Hamburg";"Telefax";"040";"6914675"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Böttcher Udo Sport-Tourenwagen Service Autohaus Hyundai";"Kieler Str. 207";"22525";"Hamburg";"";"040";"858089"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Bücker Uwe";"Max-Brauer-Allee 209";"22765";"Hamburg";"";"040";"4394235"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Bunge Arthur (GmbH & Co.) Opel Händler";"Eidelstedter Platz 30";"22523";"Hamburg";"";"040";"570001-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Catena Automobile GmbH";"Schenefelder Landstr. 174a";"22589";"Hamburg";"Telefax";"040";"870700-30"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"DAEWOO Auto-Center GmbH";"Bargteheider Str. 14";"22143";"Hamburg";"";"040";"6770505"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Deventer";"Kieler Str. 286";"22525";"Hamburg";"";"040";"545340"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Eick E.";"Ottensener Str. 125";"22525";"Hamburg";"";"040";"5404804"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Ernst Franz";"Pezolddamm 152";"22159";"Hamburg";"";"040";"640870-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Fiat Automobil AG Niederlassung Hamburg";"Nedderfeld 30";"22529";"Hamburg";"Telefax";"040";"553003-60"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Fiat Automobil AG Zweigniederlassung Hamburg";"Nedderfeld 30";"22529";"Hamburg";"";"040";"553003-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Ford Autohaus Rahlstedt GmbH";"Bargteheider Str. 26";"22143";"Hamburg";"";"040";"6776011"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Fricke Christian";"Poppenbütteler Chaussee 35";"22397";"Hamburg";"";"040";"6072576"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Gabor GmbH";"Poppenbütteler Weg 5";"22339";"Hamburg";"";"040";"538009-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Geertz Peter";"Alter Teichweg 59";"22049";"Hamburg";"";"040";"6900525"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Gräper Peter";"Walddörferstr. 294c";"22047";"Hamburg";"";"040";"6937300"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Gregor Ralf";"Redder 44";"22393";"Hamburg";"";"040";"7158901"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"H.M.";"Ueckerstr. 33";"22547";"Hamburg";"Telefax";"040";"8322555"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"H.M.V. Automobile Inh. H. Kupfernagel";"Tiedemannstr. 18";"22525";"Hamburg";"";"040";"8506665"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"HADA-Automobile Gebrauchtwagenhandel OHG";"Werner-Siemens-Str. 111";"22113";"Hamburg";"";"040";"7325544"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Heyn Peter";"Vörn Barkholt 13";"22359";"Hamburg";"Telefax";"040";"6032722"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Hofer Michael";"Friedrich-Ebert-Damm 180";"22047";"Hamburg";"";"040";"6697530"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Hopp Hanns-Jörg";"Leverkusenstr. 25";"22761";"Hamburg";"";"040";"859121"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"JEEP";"Osdorfer Landstr. 238";"22549";"Hamburg";"";"040";"807888-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Jeep Autohaus Thomas Luth";"Rahlstedter Str. 1-3";"22149";"Hamburg";"";"040";"673960-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Junge Automobile GmbH";"Kieler Str. 310";"22525";"Hamburg";"";"040";"545444"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Junge Automobile GmbH";"Kieler Str. 310";"22525";"Hamburg";"";"040";"546061"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Kallus Andreas";"Walddörferstr. 324";"22047";"Hamburg";"";"040";"6935043"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"KEITEL Autohaus Niendorf GmbH";"Adlerhorst 11";"22459";"Hamburg";"";"040";"5516868"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Kellerhoff Marlis";"Eppendorfer Stieg 10";"22299";"Hamburg";"";"040";"489463"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Kern Karl-heinz";"Raawisch 18";"22043";"Hamburg";"Telefax";"040";"65493191"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Kipke Max";"Heestweg 19";"22143";"Hamburg";"Telefax";"040";"6779079"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Klecha Andreas";"Bramfelder Chaussee 261";"22177";"Hamburg";"";"040";"6417042"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Klecha Andreas";"Bramfelder Chaussee 261";"22177";"Hamburg";"Telefax";"040";"6414087"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Kleingarn Ralf";"Sandfoort 55";"22415";"Hamburg";"";"040";"5322554"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Krall Arnold";"Fuhlsbüttler Str. 21";"22305";"Hamburg";"";"040";"2986436"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Künzel Autohaus Steilshoop GmbH";"Steilshooper Str. 319";"22309";"Hamburg";"Telefax";"040";"6303076"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Künzel Autohaus Steilshoop GmbH";"Steilshooper Str. 319";"22309";"Hamburg";"";"040";"6303073"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Künzel Autohaus Steilshoop GmbH";"Steilshooper Str. 319";"22309";"Hamburg";"Email";"info@autohauskuenzel.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"LADA Autohaus Königstraße GmbH LADA Vertragshändler Autohaus Königstraße GmbH";"Königstr. 28";"22767";"Hamburg";"";"040";"389966-01"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Lauße Albertg & Sohn (GmbH & Co)";"August-Krogmann-Str. 200";"22159";"Hamburg";"";"040";"6430051"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Lembke Oliver";"Luruper Hauptstr. 243c";"22547";"Hamburg";"";"040";"836281"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Leseberg Automobile GmbH";"Osdorfer Landstr. 211";"22549";"Hamburg";"";"040";"800904-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Lindow Jürgen";"Maurienstr. 19a";"22305";"Hamburg";"";"040";"290884"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Lunau Automobile GmbH Opel u. Suzuki";"Schellingstr. 42";"22089";"Hamburg";"";"040";"2000040"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Luth Thomas";"Rahlstedter Str. 1-3";"22149";"Hamburg";"";"040";"673960-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mascher Automobile GmbH";"Walddörferstr. 340";"22047";"Hamburg";"";"040";"6933009"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mascher Automobile GmbH";"Walddörferstr. 340";"22047";"Hamburg";"Telefax";"040";"6937266"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mindemann";"Wandsbeker Chaussee 91";"22089";"Hamburg";"";"040";"2005558"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mitsubishi Autohaus Bornemann GmbH";"Harksheider Str. 45";"22399";"Hamburg";"";"040";"6063131"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mitsubishi Autohaus im Offakamp Mitsubishi Vertragshändler Autohaus im Offakamp";"Nedderfeld";"22529";"Hamburg";"";"040";"5535016"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"MITSUBISHI Autohaus Möller & Goede";"Kuehnstr. 89";"22045";"Hamburg";"";"040";"660799"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"MITSUBISHI AUTOHAUS SEEVETAL KG";"Wildes Moor 2";"22339";"Hamburg";"";"040";"7686833"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"NFA Nutzfahrzeuge + Freizeit-Automobile GmbH";"Volksdorfer Weg 182";"22393";"Hamburg";"Telefax";"040";"600185-20"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"NFA Nutzfahrzeuge + Freizeit-Automobile GmbH";"Volksdorfer Weg 13";"22391";"Hamburg";"";"040";"6001850"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"NFA Nutzfahrzeuge + Freizeit-Automobile GmbH";"Volksdorfer Weg 182";"22393";"Hamburg";"Email";"info@nfanutzfahrzeuge.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"NFA Nutzfahrzeuge + Freizeit-Automobile GmbH";"Volksdorfer Weg 182";"22393";"Hamburg";"Email";"noreply@nfanutzfahrzeuge.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Offer Klaus-Peter";"Bramfelder Str. 105";"22305";"Hamburg";"";"040";"611047"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Offer Klaus-Peter";"Bramfelder Str. 105";"22305";"Hamburg";"Telefax";"040";"614128"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Opel Arthur Bunge OPEL AUTOHAUS BUNGE";"Eidelstedter Platz 26";"22523";"Hamburg";"";"040";"5700010"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Opel Voss Opel-Vertragshändler";"Langenhorner Chaussee 1";"22335";"Hamburg";"";"040";"5332290"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Orient Autohandel EI Sayed GmbH";"Brockhausweg 19";"22117";"Hamburg";"Telefax";"040";"7132403"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Orient Autohandel El Sayed GmbH";"Brockhausweg 19";"22117";"Hamburg";"";"040";"782742"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Palekcic Ivan";"Maimoorweg 38";"22179";"Hamburg";"";"040";"6412811"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Partner Autohaus Luth GmbH";"Tonndorfer Hauptstr. 110";"22045";"Hamburg";"";"040";"6682627"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Plechinger Günther";"Ruhrstr. 158";"22761";"Hamburg";"Telefax";"040";"8511525"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"RC Autohandel";"Niendorfer Str. 52";"22529";"Hamburg";"";"040";"585283"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Reber Helmut";"Holstenstr. 157";"22765";"Hamburg";"";"040";"4398589"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Reher Heinz";"Berner Heerweg 134";"22159";"Hamburg";"";"040";"6431670"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Reich Oskar";"Peter-Timm-Str. 9";"22457";"Hamburg";"";"040";"5508473"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Reimers Automobile Mazda,";"Holsteiner Chaussee 171";"22457";"Hamburg";"";"040";"5592094"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Renault";"Behringstr. 128";"22763";"Hamburg";"";"040";"889190-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Renault ab City Hamburg Bilia Automobile GmbH";"Ivo-Hauptmann-Ring";"22159";"Hamburg";"";"040";"645950"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Renault Auto in Stellingen Junge Automobile GmbH";"Kieler Str. 310";"22525";"Hamburg";"";"040";"546061"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"RENAULT Autohaus Debler";"Behringstr. 128";"22763";"Hamburg";"";"040";"889190-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Röhl M.";"Billwerder Billdeich 48";"22113";"Hamburg";"";"040";"7321454"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Röpcke-Automobile GmbH";"Auf dem Königslande 23";"22041";"Hamburg";"";"040";"6526163"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Röpcke-Automobile GmbH";"Auf dem Königslande 23";"22041";"Hamburg";"Telefax";"040";"683368"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Rothe Dieter";"Lademannbogen 13";"22339";"Hamburg";"Telefax";"040";"5385175"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"S.E.C. Automobile GmbH";"Pinneberger Str. 6";"22457";"Hamburg";"";"040";"5595992"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"S.E.C. Automobile GmbH";"Pinneberger Str. 6";"22457";"Hamburg";"Telefax";"040";"5592228"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Saab Autohaus Dello Saab Zentrum hamburg ... KENNER WISSEN WARUM";"Nedderfeld 89";"22529";"Hamburg";"";"040";"4662-2410"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Sander & Co.";"Drosselstr. 2";"22305";"Hamburg";"Telefax";"040";"618171"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Sandhof Frank";"Usedomstr. 14";"22047";"Hamburg";"";"040";"6682877"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Schlangen K.-D. GmbH";"Osdorfer Landstr. 238";"22549";"Hamburg";"";"040";"807888-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Schlüter Wolfgang";"Köppenstr. 16c";"22453";"Hamburg";"";"040";"5141080"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Schnehagen Franz";"Thadenstr. 162";"22767";"Hamburg";"";"040";"4390093"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Schnoor Ute";"Am Neumarkt 29";"22041";"Hamburg";"";"040";"6567400"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Schönbach Jürgen";"Waldweg 59";"22393";"Hamburg";"";"040";"6014241"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Scholtz Wolfgang";"Bahrenfelder Str. 27";"22765";"Hamburg";"Telefax";"040";"3901728"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SEAT in Horn/Billstedt Autohaus Hagemann GmbH";"Manshardtstr. 74";"22119";"Hamburg";"";"040";"6513604"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SEAT IN WEDEL HENKE AUTOMOBILE";"Krohnskamp 98";"22301";"Hamburg";"";"04103";"3904"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Siems Ulrich W.";"Oehleckerring 9";"22419";"Hamburg";"";"040";"5312419"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SKN-Autohandel";"Max-Brauer-Allee 247";"22769";"Hamburg";"";"040";"43250100"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SM Eidelstedter Autohandel GmbH";"Kieler Str. 570";"22525";"Hamburg";"Telefax";"040";"5405597"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SSANGYONG Autohaus Königstraße GmbH";"Königstr. 28";"22767";"Hamburg";"";"040";"389966-01"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Strohband Wolfgang";"Hamburger Str. 166";"22083";"Hamburg";"Telefax";"040";"294957"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Thielert Frank";"Holsteinischer Kamp 104";"22081";"Hamburg";"";"040";"291584"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Thielert Frank";"Holsteinischer Kamp 104";"22081";"Hamburg";"Telefax";"040";"2996568"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Thiesen Peter";"Lohkampstr. 18";"22523";"Hamburg";"";"040";"578355"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Thode & Sohn GmbH";"Sülldorfer Landstr. 108";"22589";"Hamburg";"";"040";"872041"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Toyota VertragsHdl.";"Holstenhofweg 42";"22043";"Hamburg";"";"040";"656900-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Trend Automobile Handelsges. mbH";"Langenhorner Chaussee 109";"22415";"Hamburg";"";"040";"5314007"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Triumphal Automobile GmbH";"Borselstr. 9";"22765";"Hamburg";"";"040";"394579"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Unruh";"Fahrenkrön 119";"22179";"Hamburg";"Telefax";"040";"6430071"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Vidal + Sohn (GmbH & Co.)";"Bornkampsweg 137";"22761";"Hamburg";"";"040";"89954-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Volvo ab City Hamburg Catena Automobile GmbH";"Osdorfer Landstr. 403";"22589";"Hamburg";"";"040";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Volvo Kille Automobile GmbH";"Möllner Landstr. 41";"22111";"Hamburg";"";"040";"7103011"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"VW-NFA Nutzfahrzeuge + Freizeit-Automobile GmbH";"Volksdorfer Weg 182";"22393";"Hamburg";"";"040";"6001850"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Weik J.";"Hildeboldtweg 19a";"22179";"Hamburg";"";"040";"6412929"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Wex C.";"Ebertallee 8";"22607";"Hamburg";"Telefax";"040";"8997729"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"WHD-Automobile";"Saseler Chaussee 9";"22391";"Hamburg";"";"040";"5366592"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Winkler Automobile/Export GmbH, Frank";"Stockkamp 15";"22607";"Hamburg";"D1Fu";"0171";"3151188"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Witt Werner";"Hamburger Str. 207";"22083";"Hamburg";"";"040";"2992724"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Wüpper Klaus";"Holsteinischer Kamp 82";"22081";"Hamburg";"";"040";"2993151"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Wulff Karsten";"Friedensallee 94";"22763";"Hamburg";"";"040";"3906025"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Wunner H.";"Schmarjestr. 42";"22767";"Hamburg";"";"040";"387605"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Zamzam Amer Mohammed";"Thiedeweg 29";"22047";"Hamburg";"";"040";"6952440"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Zenke GmbH";"Am Born 25";"22765";"Hamburg";"";"040";"391523"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Hansen Herbert";"Höhenkamp 3";"22145";"Braak b Hamburg";"Telefax";"040";"6778964"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Albert J. Knaak GmbH";"Siegfriedstr. 8";"22851";"Norderstedt";"Telefax";"040";"5293597"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Kausch und Scheel oHG";"Hans-Böckler-Ring 1";"22851";"Norderstedt";"";"040";"5248556"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Behrmann GmbH & Co. KG Automobile, Gebrüder";"Segeberger Chaussee 55";"22850";"Norderstedt";"Telefax";"040";"5293013"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"D & K Automobile GmbH";"Segeberger Chaussee 142";"22851";"Norderstedt";"";"040";"5244729"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"EG-NEUWAGEN DISCOUNT";"Quickborner Str. 146";"22844";"Norderstedt";"";"040";"5221025"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Hansen Heiner";"Tangstedter Weg 73";"22851";"Norderstedt";"";"040";"5291757"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Höfs Peter";"In de Tarpen 106";"22848";"Norderstedt";"";"040";"5236246"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Kiekebusch Automobile & Reifen";"Ochsenzoller Str. 120";"22848";"Norderstedt";"";"040";"5235067"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Köse Ozkan";"Ohechaussee 192";"22848";"Norderstedt";"";"040";"5285448"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Opel Händler Vermiet GmbH";"Ulzburger Str. 405";"22846";"Norderstedt";"";"040";"53593-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SEAT Autohaus Scheel";"Hans-Böckler-Ring 1";"22851";"Norderstedt";"";"040";"5248556"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Ahlfeld Werner (GmbH & Co.)";"Friedrich-Ebert-Allee 4";"22869";"Schenefeld, Bz Hamburg";"";"040";"8304066"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Elbgemeinden Inh. Jürgen Callesen";"Osterbrooksweg 89";"22869";"Schenefeld, Bz Hamburg";"Telefax";"040";"8391138"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Elbgemeinden Inh. Jürgen Callesen";"Osterbrooksweg 89";"22869";"Schenefeld, Bz Hamburg";"Telefax";"040";"8301435"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Elbgemeinden, Inh. Hans-Jürgen Callesen";"Osterbrooksweg 89";"22869";"Schenefeld, Bz Hamburg";"";"040";"839398-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Biesterfeldt & Schmidt GmbH & Co.KG";"Kronskamp 125";"22880";"Wedel";"";"04103";"9169-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Fricke FORD-Vertretung";"Kronskamp 115";"22880";"Wedel";"";"04103";"83033"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Rosenbaum GmbH";"Tinsdaler Weg 142b";"22880";"Wedel";"";"04103";"17999"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Weise GmbH";"Tinsdaler Weg 142";"22880";"Wedel";"";"04103";"5038"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Weise GmbH";"Tinsdaler Weg 142";"22880";"Wedel";"Telefax";"04103";"16693"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Weise GmbH";"Tinsdaler Weg 142";"22880";"Wedel";"Email";"info@autohausweise.de";""|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"FORD-Vertretung Autohaus Fricke";"Kronskamp 115";"22880";"Wedel";"";"04103";"83033"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Henke Gerd-Joachim";"Kronskamp 98";"22880";"Wedel";"";"04103";"3904"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mitsubishi-Motors";"Tinsdaler Weg 140";"22880";"Wedel";"";"04103";"5038"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SEAT-Vertragshändler Henke Automobile";"Kronskamp 98";"22880";"Wedel";"Q";"04103";"3904"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"TOYOTA Vertragshändler Autohaus Rosenbaum GmbH";"Tinsdaler Weg 142b";"22880";"Wedel";"";"04103";"17999"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Leberfinger Lutz";"Kiebitzhörn 31";"22885";"Barsbüttel";"";"040";"6703020"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Struckmeyer Horst";"Bachstr. 5";"22885";"Barsbüttel";"";"040";"7112595"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Catena Automobile GmbH";"Kurt-Fischer-Str. 33";"22926";"Ahrensburg";"";"04102";"2207-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"FIAT Autohaus Lohe GmbH";"Lohe 3";"22926";"Ahrensburg";"";"04102";"54290"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"J.K.";"Bei der Alten Kate 6";"22926";"Ahrensburg";"";"04102";"1570"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Mazda AUTOHAUS ZINGELMANN GMBH";"Kurt-Fischer-Str. 24";"22926";"Ahrensburg";"";"04102";"2228-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"SEAT-Autohaus Oettinger & Partner GmbH";"Ewige Weide 12";"22926";"Ahrensburg";"";"04102";"45091"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Suzuki Zingelmann Autohaus GmbH";"Kurt-Fischer-Str. 24";"22926";"Ahrensburg";"";"04102";"2228-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Zingelmann-Autohaus GmbH";"Kurt-Fischer-Str. 26";"22926";"Ahrensburg";"";"04102";"2228-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Pries Joachim";"Wöhrendamm 35";"22927";"Großhansdorf";"";"04102";"64992"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Pries Joachim";"Wöhrendamm 35";"22927";"Großhansdorf";"Telefax";"04102";"65335"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Schelletter Horst";"Hamburger Str. 1";"22929";"Delingsdorf";"";"04532";"6532"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Hammoor GmbH";"Hauptstr. 47";"22929";"Hammoor b Ahrensburg";"";"04532";"8216"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Prahl Mitsubishi-Vertr.-Hdl.";"Dorfstr. 53";"22929";"Schönberg, Kr Hzgt Lauenb";"";"04534";"7009"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Prahl Heinz-Günter";"Dorfstr. 53";"22929";"Schönberg, Kr Hzgt Lauenb";"";"04534";"7009"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Bargteheide GmbH";"Hamburger Str. 32";"22941";"Bargteheide";"";"04532";"6584"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus F.Kemnitz GmbH";"Lübecker Str. 25";"22941";"Bargteheide";"";"04532";"7014"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Homburg Inh. Gerhard Homburg";"Hammoorer Weg 34";"22941";"Bargteheide";"";"04532";"7482"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Nissen FORD-Vertragswerkstatt";"Hamburger Str. 58";"22946";"Trittau";"";"04154";"7196"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Riegel GmbH";"Vorburgstr. 15";"22946";"Trittau";"";"04154";"2257"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Russmeyer";"Großenseer Str. 7";"22946";"Trittau";"";"04154";"80800"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Autohaus Weber GmbH SUZUKI - Vertragshändler";"Rausdorfer Str. 39";"22946";"Trittau";"";"04154";"2527"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Beckmann Peter Autohaus";"Vorburgstr. 21";"22946";"Trittau";"";"04154";"8070-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Russmeyer GmbH Autohaus Trittau";"Großenseer Str. 7";"22946";"Trittau";"Telefax";"04154";"8080-50"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Russmeyer GmbH, Autohaus Trittau";"Großenseer Str. 7";"22946";"Trittau";"";"04154";"8080-0"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Reiche Robert";"Hamburger Str. 11";"22949";"Ammersbek";"";"040";"6050225"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.
    ls_customer-import  = |"Christiansen Thomas";"";"22956";"Grönwohld, Kr Stormarn";"";"04154";"5029"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    ls_customer-import  = |"Christiansen Thomas";"";"22956";"Grönwohld, Kr Stormarn";"";"04154";"5030"|.
    ls_customer-uuid = cl_system_uuid=>create_uuid_x16_static( ). INSERT INTO ztl_02_09_cs VALUES @ls_customer.

    out->write('Import erfolgreich!').

  ENDMETHOD.
ENDCLASS.
