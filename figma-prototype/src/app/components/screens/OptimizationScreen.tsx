import React from 'react';
import { Brain, Battery, TrendingUp, Shield, Zap, ChevronRight, CheckCircle2, Clock, Target } from 'lucide-react';

export function OptimizationScreen() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-50 to-white pb-24">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white px-6 pt-6 pb-8">
        <div className="flex items-center gap-3 mb-1">
          <Brain className="w-6 h-6 text-emerald-400" />
          <h1 className="text-2xl">AI Optimization</h1>
        </div>
        <p className="text-slate-300 text-sm">
          Intelligent energy management working for you
        </p>
      </div>

      <div className="px-6 -mt-4 space-y-6">
        {/* Active Optimization Mode */}
        <div className="bg-white rounded-2xl shadow-lg border border-slate-100 overflow-hidden">
          <div className="bg-gradient-to-r from-emerald-500 to-emerald-600 text-white px-5 py-4">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center">
                  <Target className="w-5 h-5" />
                </div>
                <div>
                  <div className="text-emerald-100 text-xs mb-0.5">Active Mode</div>
                  <div className="text-lg">Balanced Optimization</div>
                </div>
              </div>
              <CheckCircle2 className="w-6 h-6 text-emerald-200" />
            </div>
          </div>
          
          <div className="p-5 space-y-3">
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                <TrendingUp className="w-4 h-4 text-blue-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Optimizing for cost savings</div>
                <div className="text-xs text-slate-600">Maximizing self-consumption and reducing grid dependency</div>
              </div>
            </div>
            
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 bg-purple-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                <Shield className="w-4 h-4 text-purple-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Protecting system lifespan</div>
                <div className="text-xs text-slate-600">Intelligent charge/discharge cycles to preserve battery health</div>
              </div>
            </div>

            <div className="flex items-start gap-3">
              <div className="w-8 h-8 bg-amber-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                <Zap className="w-4 h-4 text-amber-600" />
              </div>
              <div className="flex-1">
                <div className="text-sm text-slate-900 mb-1">Monitoring power quality</div>
                <div className="text-xs text-slate-600">Real-time analysis preventing equipment damage</div>
              </div>
            </div>
          </div>
        </div>

        {/* Optimization Modes */}
        <div>
          <h2 className="text-sm text-slate-500 uppercase tracking-wider mb-3 px-1">Available Modes</h2>
          <div className="space-y-3">
            <button className="w-full bg-white rounded-xl border-2 border-emerald-500 p-4 text-left">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 bg-emerald-100 rounded-lg flex items-center justify-center">
                    <Target className="w-5 h-5 text-emerald-600" />
                  </div>
                  <div>
                    <div className="text-slate-900">Balanced Mode</div>
                    <div className="text-xs text-emerald-600 flex items-center gap-1">
                      <CheckCircle2 className="w-3 h-3" />
                      Active
                    </div>
                  </div>
                </div>
              </div>
              <div className="text-xs text-slate-600 ml-[52px]">
                Optimal balance between savings and system longevity
              </div>
            </button>

            <button className="w-full bg-white rounded-xl border border-slate-200 p-4 text-left hover:border-slate-300 transition-colors">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                    <TrendingUp className="w-5 h-5 text-blue-600" />
                  </div>
                  <div>
                    <div className="text-slate-900">Maximum Savings</div>
                    <div className="text-xs text-slate-500">Available</div>
                  </div>
                </div>
                <ChevronRight className="w-5 h-5 text-slate-400" />
              </div>
              <div className="text-xs text-slate-600 ml-[52px]">
                Prioritize cost reduction, may accelerate battery wear
              </div>
            </button>

            <button className="w-full bg-white rounded-xl border border-slate-200 p-4 text-left hover:border-slate-300 transition-colors">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center">
                    <Shield className="w-5 h-5 text-purple-600" />
                  </div>
                  <div>
                    <div className="text-slate-900">Longevity Mode</div>
                    <div className="text-xs text-slate-500">Available</div>
                  </div>
                </div>
                <ChevronRight className="w-5 h-5 text-slate-400" />
              </div>
              <div className="text-xs text-slate-600 ml-[52px]">
                Extend system lifespan with gentler charge cycles
              </div>
            </button>
          </div>
        </div>

        {/* Recent Optimization Actions */}
        <div>
          <h2 className="text-sm text-slate-500 uppercase tracking-wider mb-3 px-1">Recent AI Actions</h2>
          <div className="bg-white rounded-xl border border-slate-200 divide-y divide-slate-100">
            <div className="p-4">
              <div className="flex items-start gap-3">
                <div className="w-8 h-8 bg-green-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                  <Battery className="w-4 h-4 text-green-600" />
                </div>
                <div className="flex-1">
                  <div className="text-sm text-slate-900 mb-1">Battery charge limited to 85%</div>
                  <div className="text-xs text-slate-600 mb-2">
                    Low solar forecast tomorrow — preserving battery cycles
                  </div>
                  <div className="flex items-center gap-2 text-xs text-slate-500">
                    <Clock className="w-3 h-3" />
                    <span>2 hours ago</span>
                    <span className="text-slate-300">•</span>
                    <span className="text-emerald-600">+R12 estimated savings</span>
                  </div>
                </div>
              </div>
            </div>

            <div className="p-4">
              <div className="flex items-start gap-3">
                <div className="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                  <Zap className="w-4 h-4 text-blue-600" />
                </div>
                <div className="flex-1">
                  <div className="text-sm text-slate-900 mb-1">Increased self-consumption rate</div>
                  <div className="text-xs text-slate-600 mb-2">
                    Grid electricity price spike detected — storing more energy
                  </div>
                  <div className="flex items-center gap-2 text-xs text-slate-500">
                    <Clock className="w-3 h-3" />
                    <span>5 hours ago</span>
                    <span className="text-slate-300">•</span>
                    <span className="text-emerald-600">+R28 estimated savings</span>
                  </div>
                </div>
              </div>
            </div>

            <div className="p-4">
              <div className="flex items-start gap-3">
                <div className="w-8 h-8 bg-purple-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                  <Shield className="w-4 h-4 text-purple-600" />
                </div>
                <div className="flex-1">
                  <div className="text-sm text-slate-900 mb-1">Discharge depth reduced</div>
                  <div className="text-xs text-slate-600 mb-2">
                    Battery health optimization — extending lifespan by 180 days
                  </div>
                  <div className="flex items-center gap-2 text-xs text-slate-500">
                    <Clock className="w-3 h-3" />
                    <span>Yesterday</span>
                    <span className="text-slate-300">•</span>
                    <span className="text-purple-600">+240 cycles preserved</span>
                  </div>
                </div>
              </div>
            </div>

            <div className="p-4">
              <div className="flex items-start gap-3">
                <div className="w-8 h-8 bg-amber-100 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                  <TrendingUp className="w-4 h-4 text-amber-600" />
                </div>
                <div className="flex-1">
                  <div className="text-sm text-slate-900 mb-1">Peak shaving activated</div>
                  <div className="text-xs text-slate-600 mb-2">
                    Grid demand charge threshold approaching — using stored energy
                  </div>
                  <div className="flex items-center gap-2 text-xs text-slate-500">
                    <Clock className="w-3 h-3" />
                    <span>2 days ago</span>
                    <span className="text-slate-300">•</span>
                    <span className="text-emerald-600">+R145 estimated savings</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* How It Works */}
        <div className="bg-gradient-to-br from-slate-50 to-blue-50 rounded-2xl border border-blue-100 p-5">
          <div className="flex items-center gap-2 mb-3">
            <Brain className="w-5 h-5 text-blue-600" />
            <h3 className="text-slate-900">How AI Optimization Works</h3>
          </div>
          <div className="space-y-3 text-sm text-slate-700">
            <p className="leading-relaxed">
              Ohwr's AI continuously monitors your system performance, weather forecasts, grid pricing, and battery health metrics.
            </p>
            <p className="leading-relaxed">
              Based on this data, the system automatically adjusts charge rates, discharge depth, and energy distribution to maximize your savings while protecting your equipment.
            </p>
            <p className="leading-relaxed">
              All optimizations happen automatically in the background — no manual intervention required.
            </p>
          </div>
        </div>

        {/* Stats Summary */}
        <div className="bg-white rounded-xl border border-slate-200 p-5">
          <h3 className="text-slate-900 mb-4">Optimization Impact (This Month)</h3>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <div className="text-2xl text-emerald-600 mb-1">R342</div>
              <div className="text-xs text-slate-600">Additional Savings</div>
            </div>
            <div>
              <div className="text-2xl text-purple-600 mb-1">+420</div>
              <div className="text-xs text-slate-600">Battery Cycles Saved</div>
            </div>
            <div>
              <div className="text-2xl text-blue-600 mb-1">127</div>
              <div className="text-xs text-slate-600">AI Actions Taken</div>
            </div>
            <div>
              <div className="text-2xl text-slate-900 mb-1">98.4%</div>
              <div className="text-xs text-slate-600">Optimization Uptime</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
