import React from 'react';
import { Loader2 } from 'lucide-react';

export function LoadingState() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-blue-900">
      <div className="text-center">
        <Loader2 className="w-12 h-12 text-emerald-400 animate-spin mx-auto mb-4" />
        <h2 className="text-white text-xl mb-2">Ohwr</h2>
        <p className="text-slate-300 text-sm">Loading your solar insights...</p>
      </div>
    </div>
  );
}
