import { Field, Int, ObjectType } from '@nestjs/graphql';
import { CountryModel } from '../country/country.model';

@ObjectType()
export class NationalityModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => CountryModel, { nullable: true })
  country?: CountryModel | null;

  @Field(() => Int, { nullable: true })
  countryId!: number | null;
}
