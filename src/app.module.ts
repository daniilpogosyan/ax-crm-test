import { Module } from '@nestjs/common';
import { LeadModule } from './modules/lead/lead.module';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { join } from 'path';
import { PrismaModule } from 'src/modules/prisma/prisma.module';
import { ModelResolversModule } from '@common/resolvers';
import { GeneralModule } from 'src/modules/general/general.module';

@Module({
  imports: [
    PrismaModule,
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      playground: true,
      autoSchemaFile: true,
      sortSchema: true,
      introspection: true,
    }),
    GeneralModule,
    LeadModule,
    ModelResolversModule,
  ],
})
export class AppModule {}
