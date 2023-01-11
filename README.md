[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Consultancy-2208/west_fl_wx_fe">
    <img src="lib/assets/consultancy.jpeg" alt="Logo" width="200" height="200">
  </a>

  <h1 align="center">West FL WX</h3>

  <h3 align="center">
    Get the info you need in severe weather!
  </h3>
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
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</li>
    <li><a href="#license">License</a></li></a>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

![Product Demo](lib/assets/demo.gif)

Getting reliable information in an emergency is critical to your safety. West FL WX is a service that seeks to collect the most up-to-date weather forecast, road conditions, and emergency information from your local leaders. This information will be sent to you via e-mail so it can be saved on your local device in the event of power or internet outages. This will ensure you always have the information you need in an emergency.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

West FL WX is a Rails web application and e-mail service.

<img src="lib/assets//tech-stack.png" alt="Tech-Stack">

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

MVP

* [x] Create User parent table
* [x] Create Plan, Records, Prep Kit, Kids, Cars, Houses and Pets child tables
* [x] Create Root, Edit User and Show User view pages
* [x] Implement adaptive lists in Show User view page to reflect user selections
* [x] Implement OAuth with Google using OAuth 2.0
* [x] Implement authorization for access to Edit and Show User pages 
* [x] Implement API request to our BE service
* [x] Add css for a consistent professional look across all pages
* [x] Deploy to Heroku

Stretch Goals

* [ ] Create admin and local government accounts

See the [open issues](https://github.com/Consultancy-2208/west_fl_wx_fe/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started
**Repos:**
<br />
FE: https://github.com/Consultancy-2208/west_fl_wx_fe <br />
BE: https://github.com/Consultancy-2208/west_fl_wx_be <br />

**FE Repo Installation Instructions:**
1. fork and clone repo to local
1. bundle install
1. bundle exec figaro install
1. run rails db:{drop,create,migrate} in terminal
1. set up a project and product via google console and set up credentials for OAuth 2.0, instructions: https://support.google.com/cloud/answer/6158849?hl=en#:~:text=Go%20to%20the%20Google%20API,the%20scopes%20your%20project%20uses.
1. make sure to have profile and email selected in the scopes when setting up google oauth, if you need to edit you can do so from the OAuth consent screen
1. still under credentials: make sure to add "http://localhost:3000/auth/google_oauth2/callback" as an authorised redirect URI 
1. Add your Google Client ID and Google Secret ID, found in the credentials section in APIs and services, to config/application.yml
1. In app/services/west_fl_wx_service.rb, uncomment line 11 and comment line 12
1. Set up BE repo (linked above)
1. Start both servers (in terminal: rails s)
1. Visit: localhost:3000/ on your browser and have fun!
<br />
<b>Production:</b>
<br />
FE: https://calm-peak-36563.herokuapp.com/<br />
BE: https://stormy-harbor-06090.herokuapp.com/<br />

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/89422302?v=4" width='150'></td>
    <td><img src="https://avatars.githubusercontent.com/u/101418582?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104859844?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/108031077?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/110377741?s=150&v=4" width='150'></td>
  </tr>
  <tr>
    <td>Alex Mora</td>
    <td>Bryan Keener</td>
    <td>Eli Fuchsman</td>
    <td>Joseph Hilby</td>
    <td>Mostafa Sakr</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/AlexMR-93">GitHub</a><br>
      <a href="https://www.linkedin.com/in/alex-m-b25902240/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/bkeener7">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bkeener/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/efuchsman">GitHub</a><br>
      <a href="https://www.linkedin.com/in/elifuchsman/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/josephhilby">GitHub</a><br>
      <a href="https://www.linkedin.com/in/josephmhilby/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/msakr21">GitHub</a><br>
      <a href="https://www.linkedin.com/in/mostafasakr16">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Consultancy-2208/west_fl_wx_fe.svg?style=for-the-badge
[contributors-url]: https://github.com/Consultancy-2208/west_fl_wx_fe/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Consultancy-2208/west_fl_wx_fe.svg?style=for-the-badge
[forks-url]: https://github.com/Consultancy-2208/west_fl_wx_fe/network/members
[stars-shield]: https://img.shields.io/github/stars/Consultancy-2208/west_fl_wx_fe.svg?style=for-the-badge
[stars-url]: https://github.com/Consultancy-2208/west_fl_wx_fe/stargazers
[issues-shield]: https://img.shields.io/github/issues/Consultancy-2208/west_fl_wx_fe.svg?style=for-the-badge
[issues-url]: https://github.com/Consultancy-2208/west_fl_wx_fe/issues
