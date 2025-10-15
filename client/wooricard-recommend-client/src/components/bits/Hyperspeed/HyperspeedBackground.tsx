'use client';

import Hyperspeed from './Hyperspeed';
import { hyperspeedPresets } from '@/components/bits/Hyperspeed/presets';

export default function HyperspeedBackground() {
    return <Hyperspeed effectOptions={hyperspeedPresets.future} />;
}
