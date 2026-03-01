import React from 'react';
import { Brain, DollarSign, Shield, Zap, TrendingUp, Award, X } from 'lucide-react';

interface WelcomeModalProps {
  onClose: () => void;
}

export function WelcomeModal({ onClose }: WelcomeModalProps) {
  return (
    <div className="fixed inset-0 bg-slate-900/90 backdrop-blur-sm z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-3xl max-w-md w-full max-h-[90vh] overflow-y-auto">
        {/* Header */}
        <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white p-6 rounded-t-3xl relative overflow-hidden">
          <button 
            onClick={onClose}
            className="absolute top-4 right-4 w-8 h-8 rounded-full bg-white/10 flex items-center justify-center hover:bg-white/20 transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
          <div className="absolute inset-0 opacity-10">
            <div className="absolute top-0 right-0 w-32 h-32 border border-white rounded-full"></div>
            <div className="absolute bottom-0 left-0 w-24 h-24 border border-white rounded-full"></div>
          </div>
          <div className="relative z-10">
            <div className="w-16 h-16 bg-emerald-500 rounded-2xl flex items-center justify-center mb-4">
              <Brain className="w-8 h-8 text-white" />
            </div>
            <h1 className="text-2xl mb-2">Welcome to Ohwr</h1>
            <p className="text-slate-300 text-sm leading-relaxed">
              The first AI-powered renewable energy intelligence platform that transforms solar data into measurable savings and extended system life.
            </p>
          </div>
        </div>

        {/* Value Props */}
        <div className="p-6 space-y-4">
          <div className="flex items-start gap-4">
            <div className="w-12 h-12 rounded-xl bg-emerald-100 flex items-center justify-center flex-shrink-0">
              <DollarSign className="w-6 h-6 text-emerald-600" />
            </div>
            <div>
              <h3 className="text-slate-900 mb-1">17.9% Higher Returns</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                Our AI optimization generates an average of <span className="text-slate-900">R1,186/year</span> in additional revenue vs. standard monitoring.
              </p>
            </div>
          </div>

          <div className="flex items-start gap-4">
            <div className="w-12 h-12 rounded-xl bg-blue-100 flex items-center justify-center flex-shrink-0">
              <Shield className="w-6 h-6 text-blue-600" />
            </div>
            <div>
              <h3 className="text-slate-900 mb-1">+2.4 Years Lifespan</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                Predictive maintenance and intelligent load management extend system longevity by <span className="text-slate-900">28.4 years</span> vs. industry avg of 26.
              </p>
            </div>
          </div>

          <div className="flex items-start gap-4">
            <div className="w-12 h-12 rounded-xl bg-purple-100 flex items-center justify-center flex-shrink-0">
              <Brain className="w-6 h-6 text-purple-600" />
            </div>
            <div>
              <h3 className="text-slate-900 mb-1">94.2% Prediction Accuracy</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                Machine learning forecasts enable optimal energy planning, reducing grid dependency and maximizing self-consumption.
              </p>
            </div>
          </div>

          <div className="flex items-start gap-4">
            <div className="w-12 h-12 rounded-xl bg-amber-100 flex items-center justify-center flex-shrink-0">
              <TrendingUp className="w-6 h-6 text-amber-600" />
            </div>
            <div>
              <h3 className="text-slate-900 mb-1">24% Faster Payback</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                Intelligence accelerates ROI from <span className="text-slate-500">6.8 years</span> to <span className="text-emerald-600">5.2 years</span>, reaching profitability 1.6 years earlier.
              </p>
            </div>
          </div>

          {/* Key Differentiator */}
          <div className="bg-gradient-to-br from-slate-50 to-blue-50 rounded-2xl p-4 border border-blue-100">
            <div className="flex items-center gap-2 mb-2">
              <Award className="w-5 h-5 text-blue-600" />
              <h4 className="text-slate-900">The Intelligence Advantage</h4>
            </div>
            <p className="text-sm text-slate-700 leading-relaxed">
              While basic monitoring shows you what happened, Ohwr's AI tells you what's happening, what will happen, and what to do about it—preventing problems before they cost you money.
            </p>
          </div>

          {/* Lifetime Value */}
          <div className="bg-gradient-to-br from-emerald-500 to-emerald-600 rounded-2xl p-5 text-white">
            <div className="text-emerald-100 text-sm mb-1">25-Year Projected Value</div>
            <div className="text-3xl mb-2">R109,800</div>
            <p className="text-emerald-50 text-sm">
              <span className="text-white">494% ROI</span> combining savings, AI optimization, and avoided repairs
            </p>
          </div>

          {/* CTA */}
          <button 
            onClick={onClose}
            className="w-full bg-gradient-to-r from-blue-600 to-blue-700 text-white py-4 rounded-xl hover:from-blue-700 hover:to-blue-800 transition-all shadow-lg"
          >
            Explore Your Dashboard
          </button>

          <p className="text-center text-xs text-slate-500">
            Real data from your 8.4kW system in Pretoria, Gauteng
          </p>
        </div>
      </div>
    </div>
  );
}