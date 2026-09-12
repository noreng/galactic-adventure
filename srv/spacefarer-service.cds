using { sap.galactic.spacefarers as db } from '../db/schema';

service GalacticSpacefarerService @(path: '/odata/v4/galactic') {
  entity Spacefarers as projection on db.Spacefarers;
  entity Departments as projection on db.Departments;
  entity Positions   as projection on db.Positions;
}
