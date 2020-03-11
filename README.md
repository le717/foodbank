# Lighthouse

> A foodbank-oriented client information and check-in platform


## Description

**Lighthouse** is a platform designed to aid foodbanks in recording client information and, optionally, tracking clients through the assistance process. While the system has been tailored for the processes at the Compassion Christian Church [Lighthouse Ministry](https://compassionchristian.com/lighthouse/), it has been designed to support multiple organizations. The platform can also be utilized solely as a client records system without using the check-in process.

The content in this readme is provided solely as a high-level overview of the  platform. Full, detailed documented is available in the `docs/` folder.

### Platform hierarchy

The platform has been divided into a few different hierarchies for flexibility and ease of use. These can be divided into two categories: users and organizations.

#### Organizations

_Organizations_ are the umbrella entity (typically the church or non-profit organization) that manages the foodbank. Organizations must have at least one defined _campus_, which is the physical location of the foodbank.

#### Users

_Users_ are classified as the platform users. That is, they are the people who administer and use the platform for the foodbank. There are three possible user roles:
-  Admin: They have full control over the platform, having the ability to manage organizations, campuses, and users, as well as perform functions for every organization.
- Staff: They are the individual foodbank workers. They belong to a single organization and deal primarily with client records.
- Ministers: They are the foodbank staff who engage with the client's spiritual needs. They perform counseling services with clients as part of the check-in process. They belong to a single organization and deal primarily with the client check-in process but can also work with client records.

New users can be added to the platform by running the `scripts/create-user.py` script.

## Development requirements
- Python 3.8+
- Poetry v1.0.0+
- Docker Desktop
- Visual Studio Code (recommended)

### Configuration keys required
- LIGHTHOUSE_SECRET_KEY
- mysql_dbname
- mysql_host
- mysql_user
- mysql_password
- mysql_password_root
- [Mailgun](https://www.mailgun.com/) domain configuration and API key (_production only_)

## Build/Deploy

```
./build-app.sh
```

## License

2020 [Contributors](https://github.com/le717/lighthouse/graphs/contributors)
