
# UCSB AMENITIES

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[Description of your app]
Help UCSB students locate some important amenities on campus, which are bathrooms and study rooms. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Utility/Productivity
- **Mobile:** Maps and navigation apps work well on mobile. Mobile is view only, uses location of user to showcase  
- **Story:** Allows users to quickly find study spots and bathrooms when needed in a pinch.  
- **Market:** UCSB students - over 20,000 students
- **Habit:** Study spots and bathrooms are places students need to go to every day
- **Scope:** We want to start with study locations and bathrooms using a map, but may be expanded to other useful locations in the future. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* *Stream*: scrolling list view of locations (possibly ordered closest to user?)
* *Maps*: map with color-coded pins that mark locations 

**Optional Nice-to-have Stories**

* *Detail*: if a student clicks on the list/pin on the map, it goes to another screen that expands on more detail of location, e.g any features the study area might have (outlets, whiteboards, etc..) or what time a bathroom is locked or closed 

### 2. Screen Archetypes

* [Home screen]
   * List of amenities (bathroom and study rooms) maybe instead of just a home page there can be two pages, as described below
* [Map of UCSB]
   * contains color codded pins on where the bathroom and study room are on UCSB campus
* [Restrooms]
   * list view of restrooms, with a search feature
* [Study locs]
   * list view of study locations, with overview for each location 
* [Settings]
   * settings tab to change gender preferences and other things to change the priority ordering/ filtering for study locations and bathrooms

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home: List view of locations, e.g bathrooms
* Map: Map view, has color-coded pins that mark the location 
* Study locs 
* Restrooms
* Settings

**Flow Navigation** (Screen to Screen)
* Study locs -> map tab
* Restrooms -> map tab 
* Settings -> Toggle settings

## Wireframes
https://www.figma.com/file/mgLcVCt9nYRo9E1Gi4T3gR/Amenities?node-id=0%3A1

<img src="https://i.imgur.com/ThtzkIP.png" width=800><br>

Interactive Demo: https://www.figma.com/proto/mgLcVCt9nYRo9E1Gi4T3gR/Amenities?node-id=1%3A2&scaling=scale-down&page-id=0%3A1&starting-point-node-id=18%3A20

<img src="https://i.imgur.com/yNd0qXs.gif" width=200><br>

## Schema 
### Models
#### User Info

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | username      | String   | username for an account |
   | password        | String| login info |
   | gender         | String     | user's preferred gender for restrooms |
#### Location Reviews
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
  | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | rating         | Integer     | rating of location |
   | review | String | quick description of the location |

#### Location Info 
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
  | objectId      | String   | location name |
   | reviews        | Double| average rating of location |
   | tags         | String array     | Array of labels relating to the location (quietness, size, etc) |



### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Ratings")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (ratings: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let ratings = ratings {
               print("Successfully retrieved \(ratings.count) ratings.")
            }
         }
         ```
      - (Create/POST) Leave a rating or change a rating
      - (Delete) Delete existing rating

#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name

##### Google Maps API 
- Base URL - https://www.google.com/maps/embed/v1/place
  ?key=YOUR_API_KEY
  
- Website -https://developers.google.com/maps/documentation/embed/embedding-map 

- Parameters -
    
![](https://i.imgur.com/6f0kgd8.png)
![](https://i.imgur.com/G2lVnmD.png)
![](https://i.imgur.com/ekGYnZx.png)


