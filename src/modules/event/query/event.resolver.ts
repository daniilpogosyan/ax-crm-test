import { Inject } from '@nestjs/common';
import { Resolver } from '@nestjs/graphql';
import { EventQueryService } from 'src/modules/event/query/event.service';

@Resolver()
export class EventQueryResolver {
  constructor(@Inject(EventQueryService) private eventService: EventService) {}
}
