## Requirements and recommendations list

Render a list of requirements, recommendations and other data lists from `_data` folder. The list has to have a specific format:

* `id` - the unique ID. Try to use following pattern: `REQ_001`, `REC_001`, `PRF_001`
* `title` - the short title
* `description` (optional) - elaborates the point
* `links` (optional) - the list of links to the related
* `status` (optional) - expresses the status, i.e. Implemented.


The `links` format:

* `name` - human name
* `source` - the link: `http://xxx.com/yyy`, `/docs/some-doc`, `#another-section`, etc.

### Usage

1. Add new files in `_data`: `requirements.json`, `recommendations.json`, `preferences.json`, etc. Keep each collection as separate file.

2. You can render all lists (`requirements, recommendations`) in a one document or each in a separate file. In the first case, create: `_docs/02_requirements/01_requirements_and_recommendtations.md`. If you want separate lists, create a file per collection.

3. Edit the file(s):

```md

```
