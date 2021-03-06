import Foundation
import Combine

internal class MockURLSession: URLSession {
    var mockData: Data?
    var mockError: Error?

    init(mockData: Data? = nil, mockError: Error? = nil) {
        self.mockData = mockData
        self.mockError = mockError
    }

    init(mockData: MockData) {
        self.mockData = mockData.rawValue.data(using: .utf8)!
        self.mockError = nil
    }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> MockURLSessionDataTask {
        completionHandler(mockData, nil, mockError)
        return MockURLSessionDataTask()
    }
}

internal class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}

enum MockData: String {
    case canteens = #"[{"id":29,"name":"BioMensa U-Boot","city":"Dresden","address":"BioMensa U-Boot im Potthoffbau Untergeschoss, George-B\u00e4hr-Stra\u00dfe\/Hettnerstra\u00dfe 3, 01069 Dresden","coordinates":[51.03030323712326,13.72934550046921],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-u-boot.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/u-boot.html"},{"id":6,"name":"Mensa Reichenbachstra\u00dfe","city":"Dresden","address":"Reichenbachstr. 1, 01069 Dresden","coordinates":[51.034283226863565,13.734020590782166],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-reichenbachstrasse.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-reichenbachstrasse.html"},{"id":35,"name":"Zeltschl\u00f6sschen","city":"Dresden","address":"N\u00fcrnberger Stra\u00dfe 55, 01187 Dresden","coordinates":[51.031614756984816,13.728645443916323],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-zeltschloesschen.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/zeltschloesschen.html"},{"id":4,"name":"Alte Mensa","city":"Dresden","address":"Mommsenstr. 13, 01069 Dresden","coordinates":[51.02696733929933,13.726491630077364],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-alte-mensa.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/alte-mensa.html"},{"id":8,"name":"Mensologie","city":"Dresden","address":"Blasewitzer Str. 84, 01307 Dresden","coordinates":[51.052705307014044,13.784312009811401],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensologie.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensologie.html"},{"id":9,"name":"Mensa Siedepunkt","city":"Dresden","address":"Zellescher Weg 17, 01069 Dresden","coordinates":[51.02946063983054,13.738727867603302],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-siedepunkt.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-siedepunkt.html"},{"id":32,"name":"Mensa Johannstadt","city":"Dresden","address":"Marschnerstra\u00dfe 38, 01307 Dresden","coordinates":[51.053120073616405,13.760884255170824],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-johannstadt.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-johannstadt.html"},{"id":10,"name":"Mensa TellerRandt","city":"Tharandt","address":"Pienner Stra\u00dfe 15, 01737 Tharandt","coordinates":[50.98060093483648,13.581464588642122],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-tellerrandt.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-tellerrandt.html"},{"id":11,"name":"Mensa Palucca Hochschule","city":"Dresden","address":"Basteiplatz 4, 01277 Dresden","coordinates":[51.02895,13.770829],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-palucca-hochschule.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-palucca-hochschule.html"},{"id":33,"name":"Mensa WUeins \/ Sportsbar","city":"Dresden","address":"Wundtstra\u00dfe 1, 01217 Dresden","coordinates":[51.02990429156573,13.748951107263567],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-wueins.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-wueins.html"},{"id":34,"name":"Mensa Br\u00fchl","city":"Dresden","address":"Br\u00fchlsche Terrasse 1, 01067 DresdenZugang \u00fcber den Innenhof der HfBK","coordinates":[51.052948,13.741935],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-bruehl.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-bruehl.html"},{"id":13,"name":"Mensa Stimm-Gabel","city":"Dresden","address":"Wettiner Platz 13, 01067 Dresden","coordinates":[51.053722,13.724652],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-stimm-gabel.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-stimm-gabel.html"},{"id":24,"name":"Mensa Zittau","city":"Zittau","address":"Hochwaldstr. 12, 02763 Zittau","coordinates":[50.89042611030397,14.804495573043825],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-zittau.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-zittau.html"},{"id":25,"name":"Mensa Mahlwerk","city":"Zittau","address":"Schwenninger Weg 1, 02763 Zittau","coordinates":[50.88397255787832,14.801915287971497],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-mahlwerk.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-mahlwerk.html"},{"id":28,"name":"Mensa G\u00f6rlitz","city":"G\u00f6rlitz","address":"Furtstra\u00dfe 1a, 02826 G\u00f6rlitz","coordinates":[51.14924302208328,14.998609721660616],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-goerlitz.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-goerlitz.html"},{"id":38,"name":"Mensa Rothenburg","city":"Rothenburg","address":"Friedensstra\u00dfe 120, 02929 Rothenburg \/O.L.","coordinates":[51.353944460945506,14.96465027332306],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-rothenburg.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-rothenburg.html"},{"id":39,"name":"Mensa Bautzen Polizeihochschule","city":"Bautzen","address":"Kantstra\u00dfe 25, 02625 Bautzen","coordinates":[51.18287722211444,14.445980787277223],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-bautzen.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-bautzen.html"},{"id":42,"name":"Mensa Bautzen Studienakademie","city":"Bautzen","address":"L\u00f6bauer Stra\u00dfe 1, 02625 Bautzen","coordinates":[51.1816753,14.4358941],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-ba-bautzen.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-ba-bautzen.html"},{"id":36,"name":"Grill Cube","city":"Dresden","address":"George-B\u00e4hr-Stra\u00dfe 1A-E, 01069 Dresden","coordinates":[51.0285205,13.7287076],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-grill-cube.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/grill-cube.html"},{"id":37,"name":"Pasta-Mobil","city":"Dresden","address":"George-B\u00e4hr-Stra\u00dfe 1A-E, 01069 Dresden","coordinates":[51.02853,13.72855],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-pasta-mobil.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/pasta-mobil.html"},{"id":30,"name":"Mensa Sport","city":"Dresden","address":"Messering 2a, 01067 Dresden","coordinates":[51.06903688508011,13.71892511844635],"url":"https:\/\/www.studentenwerk-dresden.de\/mensen\/details-mensa-sport.html","menu":"https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/mensa-sport.html"}]"#
    case meals = #"""
    [
      {
        "id": 248434,
        "name": "Kr\u00e4uterquark mit Kartoffeln, Leberwurst und Butter oder vegetarisch mit Gew\u00fcrzgurke",
        "notes": [
          "enth\u00e4lt Schweinefleisch",
          "mit Konservierungsstoff (2)",
          "mit S\u00fc\u00dfungsmittel (9)",
          "Milch\/Milchzucker (Laktose) (G)",
          "Senf (J)"
        ],
        "prices": {
          "Studierende": 2.35,
          "Bedienstete": 4.27
        },
        "category": "fertig 2",
        "image": "\/\/bilderspeiseplan.studentenwerk-dresden.de\/m18\/202009\/248434.jpg",
        "url": "https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/details-248434.html"
      },
      {
        "id": 248435,
        "name": "Pflaumen Quarkkn\u00f6del mit Semmelbutter, dazu Zimtso\u00dfe",
        "notes": [
          "Men\u00fc ist vegetarisch",
          "mit Farbstoff (1)",
          "Glutenhaltiges Getreide (A)",
          "Weizen (A1)",
          "Eier (C)",
          "Milch\/Milchzucker (Laktose) (G)",
          "Ausgabe an der Pastatheke"
        ],
        "prices": {
          "Studierende": 2.35,
          "Bedienstete": 4.27
        },
        "category": "fertig 4",
        "image": "\/\/bilderspeiseplan.studentenwerk-dresden.de\/m18\/202009\/248435.jpg",
        "url": "https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/details-248435.html"
      },
      {
        "id": 248436,
        "name": "Tiegelwurst mit Sauerkraut und Petersilienkartoffeln",
        "notes": [
          "enth\u00e4lt Schweinefleisch",
          "mit Konservierungsstoff (2)",
          "Glutenhaltiges Getreide (A)",
          "Weizen (A1)",
          "Senf (J)"
        ],
        "prices": {
          "Studierende": 2.55,
          "Bedienstete": 4.64
        },
        "category": "fertig 1",
        "image": "\/\/bilderspeiseplan.studentenwerk-dresden.de\/m18\/202009\/248436.jpg",
        "url": "https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/details-248436.html"
      },
      {
        "id": 248914,
        "name": "Asiatische Gem\u00fcsesuppe",
        "notes": [
          "Men\u00fc ist vegan",
          "Glutenhaltiges Getreide (A)",
          "Weizen (A1)",
          "Soja (F)"
        ],
        "prices": {
          "Studierende": 1.97,
          "Bedienstete": 3.59
        },
        "category": "Terrine",
        "image": "\/\/static.studentenwerk-dresden.de\/bilder\/mensen\/studentenwerk-dresden-lieber-mensen-gehen.jpg",
        "url": "https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/details-248914.html"
      },
      {
        "id": 246363,
        "name": "Buntes aus unserer Salatwerkstatt, nach Wunsch zusammengestellt von unseren Mitarbeitern. W\u00e4hlbar gern auch in veganer oder vegetarischer Form.",
        "notes": [
          "Men\u00fc ist vegan"
        ],
        "prices": {
          "Studierende": 2.4,
          "Bedienstete": 4.37
        },
        "category": "fertig 3",
        "image": "\/\/bilderspeiseplan.studentenwerk-dresden.de\/m18\/202009\/246363.jpg",
        "url": "https:\/\/www.studentenwerk-dresden.de\/mensen\/speiseplan\/details-246363.html"
      }
    ]
    """#
}
