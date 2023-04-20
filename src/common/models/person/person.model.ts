import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class PersonModel {
  @Field(() => String, { nullable: true })
  displayName: string;

  @Field(() => String, { nullable: true })
  firstName?: string;

  @Field(() => String, { nullable: true })
  lastName?: string;

  @Field(() => Date, { nullable: true })
  birthDate?: Date;
}
