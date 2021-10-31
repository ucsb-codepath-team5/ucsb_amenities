
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
   * List of amenities (bathroom and study rooms)
* [Map of UCSB]
   * contains color codded pins on where the bathroom and study room are on UCSB campus
* [list third screen here]
   * [list associated required story here]
   * ...

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home: List view of locations, e.g bathrooms
* Map: Map view, has color-coded pins that mark the location 
* [fill out your third tab]

**Flow Navigation** (Screen to Screen)

* Home: List View
   * Map: If someone selects a location on the list view, then the screen goes to Map, showing the pinned location on the map.
   * ...
* [list second screen here]
   * [list screen navigation here]
   * ...
