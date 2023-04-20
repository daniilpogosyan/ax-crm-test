import { EventQueryResolver } from './event.resolver';
import { EventQueryService } from './event.service';

export const eventQueryProviders = [EventQueryResolver, EventQueryService];
