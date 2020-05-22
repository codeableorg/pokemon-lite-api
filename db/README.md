# Pokemon Lite API Data

The seed data from NiArtic Labs has come but with it, new requirements came as well. 😮😮😮

The following image represents the content of the csv file:

![](https://p-vvf5mjm.t2.n0.cdn.getcloudapp.com/items/RBuvpJYB/Image%202020-05-21%20at%204.54.26%20AM.png?v=3c1a7cd471c106bd799c9330f232604c)

Notice that the attribute `age` of the trainer is no longer needed and also the team member status is not a string `active` or `inactive` but a boolean `true` of `false`.

### 3.1 Create and run migrations

Create the required migrations to adapt your database to this new requirements.

> You could drop your database and create it again to avoid problems with the test data you have created until now.

- Migration 1: Remove the column `age` from the `Trainer`.
- Migration 2: Change the type of the column `team_member` from `string` to `boolean`

### 3.2 Add validations to your models

NiArtic Labs is worrie about the validity of the data. They think that some records of the csv file they have sent are corrupted. They has asked to add the following validations:

- The following columns can't be blank: `t_name, t_gender, name, main_ability, main_type`
- The following columns should accept only specific values:
  - `t_team_member` : Only `true` or `false`
  - `main_type`: Only one of the following, `bug, electric, fairy, fighting, fire, flying, grass, ground, ice, normal, poison, psychic, rock, steel, water`
- The following columns should be unique: `t_name, name`
- The following columns should be greater than or equal to 0: `wins, losses`

### 3.3 Load the csv data to your models

Write a little program inside `db/seeds.rb` to load the csv file and seed your database only with valid records.

Don't forget the relations between models. If a `Trainer` is invalid and it is not save to the DB, their `BattleRecord` shouldn't be saved either. Same for the `Trainer-Pokemon` relationship.

Explore the methods `find_or_create_by` and `find_or_initialize_by` for this task. They are very useful here.
