import { Field, Int, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class CountryModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => String)
  phoneCode!: string;
}
