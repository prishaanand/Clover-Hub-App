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

##### Welcome + Permission
<img width="250" height="470" alt="onboarding1" src="https://user-images.githubusercontent.com/60487925/188354294-5002b5e9-1ff6-48a1-82e5-cd471ddf4c84.png"> <img width="250" height="470" alt="onboarding2" src="https://user-images.githubusercontent.com/60487925/188354303-1dfa0cc3-a77b-4292-a6bd-3682f7365360.png"> <img width="250" height="470" alt="permission" src="https://user-images.githubusercontent.com/60487925/188354305-37b196aa-42e0-4dc2-bf44-5232ed038a21.png">

##### List + Map Views
<img width="250" height="470" alt="listview1" src="https://user-images.githubusercontent.com/60487925/188354318-c2f6ddd4-88c6-45c4-bdce-670d4045c82f.png"> <img width="250" height="470" alt="listview2" src="https://user-images.githubusercontent.com/60487925/188354323-5ad69b28-fe52-4a74-b55c-b2ac51f0e876.png"> <img width="250" height="470" alt="mapview" src="https://user-images.githubusercontent.com/60487925/188354325-6eb721b4-62ac-4867-9783-5ad2d551dc3d.png">

##### Details
<img width="250" height="470" alt="detailsview" src="https://user-images.githubusercontent.com/60487925/188354342-0dad6f48-c3d3-417a-af04-6204bbfe8756.png"> <img width="250" height="470" alt="yelphyperlink" src="https://user-images.githubusercontent.com/60487925/188354346-b391905c-9dd1-4ff9-95af-f5b911b515fc.png">

##### Directions
<img width="250" height="470" alt="directionsview" src="https://user-images.githubusercontent.com/60487925/188354372-26f32d58-2e84-4ae4-aee4-3130a9402651.png"> <img width="250" height="470" alt="directionsapple" src="https://user-images.githubusercontent.com/60487925/188354369-2a049142-3349-44ef-834e-84028c1e8e5a.png">

#### Special Features:
- All the details provided for each business are hyperlinked to the corresponding app. For instance, when viewing the phone number of a certain restaurant or sight, users can simply tap on the "Call" button and it will take to them to the phone app. 
- Map pins are tappable and provide the same detailed view as from the list. 
- Directions to the location can be previewed within the app as well as directly opened in Apple Maps. 
- Same features are available from any location.

#### Note On Replication:
Since this app utilizes the Yelp API, I had to create a personal API key in order to fetch information from Yelp's database. Because of privacy reasons
(according to Yelp's developer documentation), I was not able to share the key. So, when you try to run this code on your own device, it will continually
load after geolocating permission is granted, since the API key was omitted. In order to make your own key and use this project, you can go to 
https://www.yelp.com/developers/documentation/v3. 
