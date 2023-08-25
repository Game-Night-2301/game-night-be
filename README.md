<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Game-Night-2301">
    <img src="https://user-images.githubusercontent.com/120869196/253766698-18414249-a92b-4b58-9032-ac67ce3b26b0.png" alt="Logo" >
  </a>

<h2 align="center">Game Night - A competition project</h2>
  <h3 allign="center"><strong><em>Disclaimer: This application used to make an external API call to <code>Board Game Atlas</code>. This service has since shut down. To keep usability for demo purposes, the data we got from that API is being loaded via a JSON file when seeding the database</em></strong></h3><br>
  <p align="center">
    Welcome to the back-end repository for Game Night <br><br> Game Night is a web application built for the Turing School of Software and Design's Mod 4 Capstone project. Read more about project requirements: https://mod4.turing.edu/projects/capstone/ 
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#db-design">DB Design</a></li>
    <li><a href="#endpoint">Endpoint</a></li>
    <li><a href="#technical-solutions">Technical Solutions</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Game Night is an app designed for organizing and scheduling board game get-togethers. Users can create a board game event based on the games in their collection and join games happening near them.

Game night is an excellent way to take the hassle out of scheduling get-togethers with your friends, and it acts as a means of meeting new people who share your passion for tabletop gaming.

- [Production Website](https://game-night-fe.vercel.app/)
- Backend can be accessed using using `graphQL` queries to the following URL: https://game-night-backend-172o.onrender.com/graphql
- Github repositories:
  * Front End: [![Github][Github]][project-fe-gh-url]
  * Back End: [![Github][Github]][project-be-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With:

[![Ruby][Ruby]][Ruby-url] [![Rails][Rails]][Rails-url] [![PostgreSQL][Postgres]][Postgres-url] [![Github_Actions]][GHA_url] <img src="https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white" width="85" height="28"/> <img src="https://user-images.githubusercontent.com/120869196/253767245-15d1faeb-4585-4b7a-adba-33d42190a172.jpg" witdth="auto" height="28"/> <img src="https://user-images.githubusercontent.com/116964982/238382095-7d4a3eeb-c907-4e1c-b8cf-abf6b8c20c6e.png"/> <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"/> <img src="https://user-images.githubusercontent.com/120869196/253767662-710a07ce-2cee-41e1-8c4e-ade25a38f86d.png" width="auto" height="28"/>


Game Night's back-end application uses these integrations:
* [OpenAI](https://platform.openai.com/docs/introduction)
* [Board Game Atlas](https://www.boardgameatlas.com/api/docs)
* [Geocoder](https://github.com/alexreisner/geocoder/blob/master/README.md)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

To demo Game Night on your local machine, follow these steps: 
* <em>Note: Since <code>Board Game Atlas</code> no longer exists, getting an API key is unnecessary. The data initially to be loaded into the database from the API call is now loaded from a json file when the database is seeded.</em>

### Back End Repository

1. ~~Get a free Board Game Atlas API Key [here](https://www.boardgameatlas.com/signup)~~
2. Register for an OpenAI API Key [here](https://platform.openai.com/overview)
3. Clone this repo `git@github.com:Game-Night-2301/game-night-be.git`
4. Navigate to the local repository: `cd game-night-be`
5. Run: `bundle install`
6. Run: `rails db:{drop,create,migrate,seed}`
7. Run: `bundle exec figaro install`
8. Add ~~`BOARD_GAME_ATLAS_CLIENT_ID` and~~ `OPENAI_ACCESS_TOKEN` to `config/application.yml` file
9. Run: `rails s` to start the Rails server
10. Visit: http://localhost:3000/graphiql


### Front End Repository
1. Clone the front end [here](https://github.com/Game-Night-2301/game-night-fe)
2. Follow instructions in the front-end repo `README`

### Prerequisites
- Ruby Version 3.1.1
- Rails Version 7.0.5

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Testing -->
## Testing
 
`bundle exec rspec` will run the entire test suite. *All tests are passing at the time of writing. At above 98% coverage*

The team tested happy paths, sad paths, and edge cases when needed. Error responses were added where applicable. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
## DB Design
 
 <img src="https://user-images.githubusercontent.com/120869196/253768623-2ce6305e-bd65-49d5-a87b-5d0199824f3c.png" alt="Schema" width="100%">
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Endpoint

### graphQL Queries

#### Get a User
``` 
  query {
          user(id: 1 ) {
            id
            username
            password
            city
            state
            lat
            lon
            attendingEvents {
              id
            }
            hostedEvents {
              id
            }
            recommendedGames {
              id
              name
              minPlayers
              maxPlayers
              minPlaytime
              maxPlaytime
              description
              imageUrl
              averageUserRating
              averageStrategyComplexity
            }
          }
        }
  ```
#### Get Events

  ```
query {
  event(id: 1) {
    id
    date
    address
    state
    city
    zip
    title
    cancelled
    description
    hostId
    game
    gameType
    playerCount
    startTime
    endTime
    lat
    lon
    full
    distanceFrom
    gameDetails {
      id
      name
      minPlayers
      maxPlayers
      minPlaytime
      maxPlaytime
      description
      imageUrl
      averageUserRating
      averageStrategyComplexity
    }
    host {
      id
      username
    }
    attendees {
      id
      username
    }
  }
}
```



#### Get Games
```
query {
  games {
    id
    name
    minPlayers
    maxPlayers
    minPlaytime
    maxPlaytime
    description
    imageUrl
    averageUserRating
    averageStrategyComplexity
  }
}
```


#### Get Random Game
```
query {
  randomGame {
     id
     name
     minPlayers
     maxPlayers
     minPlaytime
     maxPlaytime
     description
     imageUrl
     averageUserRating
     averageStrategyComplexity
  }
}
```
### graphQL Mutations


#### Create Event
```
mutation {
  createEvent(input: {
    date: "2023/11/7",
    address: "123 This street",
    state: "Colorado",
    city: "Denver",
    zip: 15555,
    title: "Grandma's basement",
    description: "We'll be playing caracasonne for 9 hours",
    host: 4744564,
    game: 97833646,
    gameType: "board game",
    startTime: "10:00",
    endTime: "12:00"
  }) {
    event {
      id
    }
  }
}
```

#### Create User Event
```
mutation {
  createUserEvent(input: {
      userId: 1
      eventId: 8
  }) 
  {
    userEvent {
      id
      userId
      eventId
      event {
        id
        date
        address
        state
        city
        zip
        title
        cancelled
       description
        hostId
        game
        gameType
        playerCount
        attendees {
          id
          username
        }
        }
      }
    }
  }
```

#### Create User Game
```
mutation {
            createUserGame(input: {
              userId: 1
              gameId: 2000
            }) {
              userGame {
                id
                userId
                gameId
                newGame {
                  name
                  minPlayers
                  maxPlayers
                  minPlaytime
                  maxPlaytime
                  description
                  imageUrl
                  averageUserRating
                  averageStrategyComplexity
                }
              }
            }
          }
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Technical Solutions -->
## Technical Solutions

As a part of the Capstone project requirements, the Game Night team challenged ourselves to implement a novel stretch tech that we, a full stack team, agreed on during our two-week design and development process. We selected this technology based on the challenges we expected to face while building our MVP. Back-end and Front-end both decided to use `GraphQL` as our novel stretch tech. Not included in that stretch tech category, but a stretch goal for the group was to implement AI.

### Board Game Atlas
* <b>Challenge</b>: Before a demo competition that members of the Denver tech community judged, we learned that the service at the core of this project, the Board Game Atlas API, had shut down effective Aug. 23, 2023, being that we needed this app to work before this competition the following week we as a team had to scramble to find a way to make sure the backend worked.
* <b>Solution</b>: The way we solved this was a quick, on-our-feet workaround. On the back-end, one of our team members had yet to try to rebuild the database since the API service had shut down. Since the original database was still intact, we exported the database using <code>Postico</code> into a file that we could then load into the database via the seeds file. While it is an imperfect workaround, it keeps the project running on the production website. Only so many resources are available to us that supply the same information as the previous API. We would like to add <code>BoardGameGeek</code>'s API to the project when possible, as it gives us the most similar data. This would be a lift for this team, requiring the back-end to learn <code>XML</code> and re-write our service and testing. While that on its own isn't horrible, this change would also have ramifications for the front-end of this project. With the data between the two APIs being different, that changes the data this back-end application can send to the front-end. The front-end would have to change portions of their side of the application to accommodate this change. With that in mind, we would like to accomplish this change, but it would take a dedicated effort from all seven of us to make it happen promptly.

### GraphQL
* <b>Challenge</b>: The biggest challenge for us as a back-end team came from the fact that, to this point, we had been taught and only built RESTful APIs. Transitioning from RESTful APIs to GraphQL APIs presents several challenges. Firstly, one of the main hurdles is the change in mindset and approach to data fetching. With RESTful APIs, the server defines a fixed set of endpoints and response structures, which can lead to over-fetching or under-fetching of data. GraphQL, on the other hand, allows clients to specify their exact data requirements, enabling more efficient and precise data retrieval.
* <b>Solution</b>: We researched multiple articles on building basic queries and mutations. We then decided to install `GraphiQL` to build out queries and mutations on our server to get more comfortable correctly writing, structuring, and returning queries so that the data we exposed for the Front-end was readable, useable, and correct.

### Artificial Intelligence 
* <b>Challenge</b>: This challenge was us working with something wholly novel but popular in the real world. We wanted to implement the AI to give us recommendations based on a collection of user-owned games. The challenge was that we didn't want to send, specifically ChatGPT, the entire game object stored in our database. We only wanted to send the names of the games that they owned. This while also having ChatGPT return us only the names of the games it suggests in a usable format for us to take and then expose for the front-end. Before the data was sent to the FE, we needed to make sure that the recommended game existed in our database and figure out how to handle recommending a different game if the game happened to be one we didn't have.
* <b>Solution</b>: After struggling for hours, we realized that adjusting headers in a request wasn't enough to make `VCR` re-record a response to the cassette. Once we got past the same error because of VCR, we began implementing the AI how we wanted to. We started by making a method called `get_games` that took the collection of games associated with a user and shoveled only the names of the games into an array that would be passed as an argument to the method that was querying the OpenAI API. We then specifically asked ChatGPT to, based on the collection we just gave it, only return the recommendations as the names of the games as strings inside an array. From there, we passed that data to the `Games` model and validated whether or not that game was in our database. We used an ActiveRecord to take each name in the array given to us by ChatGPT to attempt to match it to the name of the game in our database. If there was a match, we sent this game on to be exposed to the FE. If the game didn't exist in our database of 1100 games, we picked another game from our database and sent that on with the games that did match. 



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

Additional features, functionality, and potential refactors:
* Find a new external API to seed the database
* User Authentication
  * Google OAuth and/or Board Game Atlas OAuth
* Cache external API calls to improve performance
* Implement a friends list for users (Add people they know)
* Consume additional external API to expand beyond just tabletop games to video games and alike
  * Set up functionality to organize and plan, similar to board game nights:
    * Video Game tournaments
    * LAN Parties
    * TTRPG Sessions

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

### Back-end Team

| [<img alt="Dyson Breakstone" width="100" src="https://user-images.githubusercontent.com/120869196/253776345-1471e248-ddc1-461b-aeee-d8ac4d59bba4.jpeg"/>](https://www.linkedin.com/in/dyson-breakstone-4978291a2/) | [<img alt="Brian Guthrie" width="100" src="https://user-images.githubusercontent.com/120869196/253776434-25807eec-dbb2-49f8-a1fd-3fda117a3685.png"/>](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [<img alt="Stephen McPhee" width="100" src="https://user-images.githubusercontent.com/120869196/253780562-bdea39b0-2222-448b-bdb3-83f47804a79c.jpg"/>](https://www.linkedin.com/in/smcphee19/) |
| ------------------ | ------------ | ---------------- | 
| Dyson Breakstone | Brian Guthrie | Stephen McPhee |
| Back-end Developer | Back-end Developer | Back-end Developer |
| [GitHub](https://github.com/DysonBreakstone) | [GitHub](https://github.com/Brianisthebest) | [GitHub](https://github.com/SMcPhee19) |
| [LinkedIn](https://www.linkedin.com/in/dyson-breakstone-4978291a2/) |  [LinkedIn](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [LinkedIn](https://www.linkedin.com/in/smcphee19/) |

<br>

### Front-end Team

| [<img alt="Ashlee Webb" width="100" src="https://user-images.githubusercontent.com/120869196/253776976-0bae2ece-d4c5-4272-a584-b0353fbc6302.jpeg"/>](https://www.linkedin.com/in/ashlee-webb/) | [<img alt="Adriane Sutherland" width="100" src="https://user-images.githubusercontent.com/120869196/253777040-2a305d4d-c3f4-427d-a2d0-6d345b628f86.jpeg"/>](https://www.linkedin.com/in/adriane-sutherland/) | [<img alt="Trey Marshall" width="100" src="https://user-images.githubusercontent.com/120869196/253777102-92b26459-2e10-497c-91f2-7bb784de7d66.png"/>](https://www.linkedin.com/in/tdmars/) | [<img alt="John Featherstone" width="100" src="https://user-images.githubusercontent.com/120869196/253777161-8d90b254-594f-4178-8ac1-5699ccbe38ce.jpeg"/>](https://www.linkedin.com/in/john-w-featherstone/) |
| ------------ | ------------------ | ------------- | ----------------- |
| Ashlee Webb | Adriane Sutherland | Trey Marshall | John Featherstone |
| Front-end Developer | Front-end Developer | Front-end Developer | Front-end Developer |
| [GitHub](https://github.com/AshleeAWebb) | [GitHub](https://github.com/asutherland91) | [GitHub](https://github.com/tdmburr) | [GitHub](https://github.com/JWFeatherstone) |
| [LinkedIn](https://www.linkedin.com/in/ashlee-webb/) | [LinkedIn](https://www.linkedin.com/in/adriane-sutherland/) | [LinkedIn](https://www.linkedin.com/in/tdmars/) | [LinkedIn](https://www.linkedin.com/in/john-w-featherstone/) |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/Game-Night-2301/game-night-be.svg?style=for-the-badge
[contributors-url]: https://github.com/Game-Night-2301/game-night-be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Game-Night-2301/game-night-be.svg?style=for-the-badge
[forks-url]: https://github.com/Game-Night-2301/game-night-be/network/members
[stars-shield]: https://img.shields.io/github/stars/Game-Night-2301/game-night-be.svg?style=for-the-badge
[stars-url]: https://github.com/Game-Night-2301/game-night-be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Game-Night-2301/game-night-be.svg?style=for-the-badge
[issues-url]: https://github.com/Game-Night-2301/game-night-be/issues
[license-shield]: https://img.shields.io/github/license/Game-Night-2301/game-night-be.svg?style=for-the-badge
[license-url]: https://github.com/Game-Night-2301/game-night-be/blob/main/LICENSE.txt
[linkedin]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[stephen-li-url]: https://www.linkedin.com/in/smcphee19/
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Github_Actions]: https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white
[GHA_url]: https://docs.github.com/en/actions
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-fe-gh-url]: https://github.com/Game-Night-2301/game-night-fe
[project-be-gh-url]: https://github.com/Game-Night-2301/game-night-be
[stephen-gh-url]: https://github.com/SMcPhee19
