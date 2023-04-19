import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CallModule } from './modules/call/call.module';
import { LeadModule } from './modules/lead/lead.module';
import { ChatModule } from './modules/chat/chat.module';
import { PersonService } from './modules/person/person.service';
import { PersonModule } from './modules/person/person.module';

@Module({
  imports: [CallModule, LeadModule, ChatModule, PersonModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
