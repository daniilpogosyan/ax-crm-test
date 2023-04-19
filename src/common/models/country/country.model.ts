import { Field, Int, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class CountryModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => String)
  phoneCode!: string;

  @Field(() => String, { nullable: true })
  emoji?: string;

  @Field(() => String)
  shortCode1!: string;

  @Field(() => String)
  shortCode2!: string;

  @Field(() => Int, { nullable: true })
  adWordsCode!: number | null;

  // @Field(() => NationalityModel, { nullable: true })
  // nationality?: NationalityModel | null;

  // @Field(() => [LanguageModel], { nullable: true })
  // languages?: Array<LanguageModel>;

  // @Field(() => [CityModel], { nullable: true })
  // cities?: Array<CityModel>;
}
