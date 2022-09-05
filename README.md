# Clover-Hub-App
An app that displays nearby city attractions (or "clovers"). Includes reviews and directions for every location!

#### Purpose + Privacy: 
Clover Hub is an explorer's best friend! The app is designed to geolocate the user whereever they may be located and display a comprehensive list of "hidden clovers" (which are the best places the city has to offer). 
But don't worry, we care about your privacy! Because of this, we do not collect any data about your location without your permission. The user is intially requested
to accept a request for tracking their geolocation, before being shown the list of hidden clovers. 

#### Functionality: 
The user has the option to choose between either the list view, which displays all the restaurants as well as sights in a scrollable list, or a map view,
which displays the same data but as tappable pins on the world map. Each location is accompanied by how far away it is, its Yelp rating in clovers, 
number of Yelp reviews, and an image. Upon selecting the preferred location, the user is then provided with a list of details (such as phone number,
website, and a link to the reviews) about the place. They are also able to see direct directions, use Apple Maps, to the location. 

#### Views from the App! 


#### Special Features:
- All the details provided for each business are hyperlinked to the corresponding app. For instance, when viewing the phone number of a certain restaurant or 
sight, users can simply tap on the "Call" button and it will take to them to the phone app. 
- 

#### Note On Replication:
Since this app utilizes the Yelp API, I had to create a personal API key in order to fetch information from Yelp's database. Because of privacy reasons
(according to Yelp's developer documentation), I was not able to share the key. So, when you try to run this code on your own device, it will continually
load after geolocating permission is granted, since the API key was omitted. In order to make your own key and use this project, you can go to 
https://www.yelp.com/developers/documentation/v3. 
