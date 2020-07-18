# README

- Run `docker compose up`
- Navigate to localhost:3000

## Notes

- I chose to go with Ruby on Rails for the following reasons: it's good for rapid prototyping (fast support for CRUD), easy to setup & dockerize, basic familiarity
- Will run my test environment on my Linux VM then use VS Code to connect to it remotely and SSH port forwarding to connect with my browser
- Shortened links are formed using hexdigest with uuid + datetime.now as seed, then I take only the first 5 characters.
- Indexed URLs for faster resolving time
- Did not push through with 3 optional requirements (max clicks, expiration, benchmarks) to avoid surpassing 15 hrs

## Time logs
- 10:00 to 11:00: Planning requirements and studying Rails
- 12:00 to 1:30: Implemented half of the requirements. Will cook lunch. Resumed at 2:30
- 2:30pm to 6pm: Implemented all required requirements, with support for tests. Total of 5 hours.
- 6:00 to 7pm: Added page not found and polished some of the behavior (removed /go/ endpoint and made the shortened URLs look more appealing. From /go/ABC12 to /ABC12)
- 9:00 to 10pm: Optimized code and rewrote tests. Total of 8 hours for required features.
- 10:30 to 11:30pm: Dockerizing the repo
- 11:00am to 12:00pm: Introduced user authentication (register, login, logout)
- Saturday 11:00am to 4:00pm: Added admin panel, soft delete, hard delete, referer, ip address, and click count.
- Somewhere around 7pm I was trying to see why my click statistics were doubling and was doing a final run of my tests before submitting.

Total: ~ 15 hours.